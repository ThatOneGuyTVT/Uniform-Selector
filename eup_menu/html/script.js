window.addEventListener('message', function(event) {
    const data = event.data;
    
    if (data.type === 'openMenu') {
        openMenu(data.uniforms);
    } else if (data.type === 'closeMenu') {
        closeMenu();
    }
});

function openMenu(uniforms) {
    const menu = document.getElementById('menu');
    const uniformList = document.getElementById('uniformList');
    
    // Clear existing items
    uniformList.innerHTML = '';
    
    // Add uniform items
    uniforms.forEach(uniform => {
        const item = document.createElement('div');
        item.className = 'uniform-item';
        item.textContent = uniform.label;
        item.onclick = function() {
            selectUniform(uniform.value);
        };
        uniformList.appendChild(item);
    });
    
    menu.classList.remove('hidden');
}

function closeMenu() {
    const menu = document.getElementById('menu');
    menu.classList.add('hidden');
    
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({})
    });
}

function selectUniform(uniformValue) {
    fetch(`https://${GetParentResourceName()}/selectUniform`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            uniform: uniformValue
        })
    });
    
    closeMenu();
}

// Close button handler
document.addEventListener('DOMContentLoaded', function() {
    const closeBtn = document.getElementById('closeBtn');
    if (closeBtn) {
        closeBtn.onclick = closeMenu;
    }
});

// ESC key handler
document.addEventListener('keydown', function(event) {
    if (event.key === 'Escape') {
        closeMenu();
    }
});

// Utility function to get resource name
function GetParentResourceName() {
    let url = window.location.href;
    let resourceName = 'eup_menu';
    
    if (url.includes('nui://')) {
        resourceName = url.split('/')[2];
    }
    
    return resourceName;
}