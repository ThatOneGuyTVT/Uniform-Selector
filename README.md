# EUP Menu System for FiveM

A simple, standalone uniform menu system for FiveM that allows players to access emergency uniforms and outfits through an easy-to-use interface.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![FiveM](https://img.shields.io/badge/FiveM-Ready-orange)

## Features

- Clean, modern UI with smooth animations
- Support for multiple uniforms (Police, EMS, Sheriff, and more)
- Separate male and female outfit configurations
- **Full component support** including bags and parachutes (vMenu-style)
- Easy to customize and add new uniforms
- Framework agnostic (works with ESX, QBCore, ND_Core, ox_core, or standalone)
- No dependencies required
- Lightweight and optimized
- Simple command: `/uniform` or `/eup`

## Preview

![EUP Menu Preview](https://cdn.discordapp.com/attachments/1421902488973348954/1436786513558900927/image.png?ex=6910df37&is=690f8db7&hm=6915ea256bee192791a753c34be96c6496cecd88223402bd063736884bd59a2c&)

## Requirements

- Original Copy of Grand Theft Auto V
- Valid FiveM Server
- That's it! No other dependencies needed.

## Installation

1. Download the latest release
2. Extract the `eup_menu` folder to your server's `resources` directory
3. Add `ensure eup_menu` to your `server.cfg`
4. Restart your server or run `refresh` then `ensure eup_menu` in console

### Folder Structure
```
resources/
└── eup_menu/
    ├── fxmanifest.lua
    ├── config.lua
    ├── client.lua
    ├── server.lua
    └── html/
        ├── index.html
        ├── style.css
        └── script.js
```

## Usage

### In-Game Commands
- `/uniform` - Opens the uniform menu
- `/eup` - Alternative command to open the menu

### Controls
- Click on any uniform to equip it
- Click "Remove Uniform" to return to default clothing
- ESC or X button to close the menu

## Configuration

Open `config.lua` to customize your uniforms:

```lua
Config.Uniforms = {
    ['police'] = {
        label = 'Police Uniform',
        male = {
            ['tshirt_1'] = 58, ['tshirt_2'] = 0,
            ['torso_1'] = 55, ['torso_2'] = 0,
            ['arms'] = 41,
            ['pants_1'] = 25, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0,  -- NEW: Bags/Parachutes support
            -- Add more components...
        },
        female = {
            ['tshirt_1'] = 35, ['tshirt_2'] = 0,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0,
            -- Add more components...
        }
    }
}
```

### Adding Custom Uniforms

1. Use a clothing menu to preview and note down component IDs
2. Add a new uniform block to `config.lua`:

```lua
['yourjob'] = {
    label = 'Your Job Uniform',
    male = {
        ['tshirt_1'] = 0, ['tshirt_2'] = 0,
        ['torso_1'] = 0, ['torso_2'] = 0,
        ['arms'] = 0,
        ['pants_1'] = 0, ['pants_2'] = 0,
        ['shoes_1'] = 0, ['shoes_2'] = 0,
        ['helmet_1'] = -1, ['helmet_2'] = 0,
        ['chain_1'] = 0, ['chain_2'] = 0,
        ['ears_1'] = -1, ['ears_2'] = 0,
        ['mask_1'] = -1, ['mask_2'] = 0,
        ['bproof_1'] = -1, ['bproof_2'] = 0,
        ['bags_1'] = -1, ['bags_2'] = 0
    },
    female = {
        -- Same structure for female
    }
}
```

### Component IDs Reference

| Component | Description | GTA Component ID |
|-----------|-------------|------------------|
| `tshirt_1` / `tshirt_2` | Undershirt | 8 |
| `torso_1` / `torso_2` | Top/Jacket | 11 |
| `arms` | Arms/Sleeves | 3 |
| `pants_1` / `pants_2` | Pants | 4 |
| `shoes_1` / `shoes_2` | Shoes | 6 |
| `helmet_1` / `helmet_2` | Hats/Helmets (Prop) | 0 |
| `chain_1` / `chain_2` | Accessories | 7 |
| `ears_1` / `ears_2` | Earrings (Prop) | 2 |
| `decals_1` / `decals_2` | Badges/Decals | 10 |
| `mask_1` / `mask_2` | Face Masks | 1 |
| `bproof_1` / `bproof_2` | Body Armor/Vests | 9 |
| `bags_1` / `bags_2` | **Bags/Parachutes** | **5** |

*Note: Set component values to `-1` to remove them*

### Bags & Parachutes Support

This menu now supports bags and parachutes (Component 5) just like vMenu! Both items share the same drawable slot.

**Example Usage:**
```lua
['swat'] = {
    label = 'SWAT Uniform',
    male = {
        -- ... other components ...
        ['bags_1'] = 45,  -- Backpack drawable
        ['bags_2'] = 0    -- Backpack texture
    }
}
```

**Common Bag/Parachute IDs:**
- `0` - No bag/parachute
- `40-50` - Various tactical bags
- `100-132` - Parachutes and special bags

## Permissions (Optional)
Permissions are great for divisions such as SWAT or separate departments

To enable job-based permissions:

1. Set `Config.UsePermissions = true` in `config.lua`
2. Configure permissions for each uniform:
```lua
Config.Permissions = {
    ['police'] = 'police',
    ['ems'] = 'ems',
}
```
3. Add your framework's permission check in `server.lua`

## Framework Integration

### ESX Example
```lua
-- server.lua
local xPlayer = ESX.GetPlayerFromId(src)
if xPlayer.job.name == Config.Permissions[uniform] then
    -- Allow uniform
end
```

### QBCore Example
```lua
-- server.lua
local Player = QBCore.Functions.GetPlayer(src)
if Player.PlayerData.job.name == Config.Permissions[uniform] then
    -- Allow uniform
end
```

## Troubleshooting

**Command not working?**
- Check server console for errors
- Ensure the resource is started (`ensure eup_menu` in server.cfg)

**Menu not showing?**
- Press F8 and check for JavaScript errors
- Ensure all files in the `html` folder are present

**Uniforms look wrong?**
- Verify your clothing IDs match your EUP pack
- Test IDs with a clothing menu first

**Bags/Parachutes not showing?**
- Make sure you've added `['bags_1']` and `['bags_2']` to your uniform configs
- Test the drawable IDs in a clothing menu (vMenu, qb-clothing, etc.)

## Changelog

### v1.0.0
- Initial release
- Support for all GTA V clothing components
- Male and female outfit configurations
- Clean, modern UI
- **Added bags and parachutes support (Component 5)**
- Framework agnostic design
- Optional permission system

## To-Do / Future Features

- [ ] Save last worn uniform
- [ ] Admin-only uniforms
- [ ] ox_lib menu integration
- [ ] Loadout support (weapons with uniforms)
- [ ] Category organization for large uniform lists
- [ ] Glasses/Watches support

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new features
- Submit pull requests
- Show your appreciation

## License

This project is licensed under the MIT License - see below for details:

```
MIT License

Copyright (c) 2025

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Support

If you need help or have questions:
- DM me on Discord @ testacc0985

## Credits

Created by ThatOneGuyTVT

---

If you like this resource, please give it a star on GitHub!
