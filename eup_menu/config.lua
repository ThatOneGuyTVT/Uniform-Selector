Config = {}

-- Define your uniforms here
Config.Uniforms = {
    ['police'] = {
        label = 'police',
        male = {
            ['tshirt_1'] = 38, ['tshirt_2'] = 0,
            ['torso_1'] = 200, ['torso_2'] = 0,
            ['decals_1'] = 16, ['decals_2'] = 0,
            ['arms'] = 93,
            ['pants_1'] = 59, ['pants_2'] = 0,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 241, ['chain_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0,
            ['mask_1'] = -1, ['mask_2'] = 0,
            ['bproof_1'] = 5, ['bproof_2'] = 0,
            ['bags_1'] = 124, ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 35, ['tshirt_2'] = 0,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 0,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0,
            ['mask_1'] = -1, ['mask_2'] = 0,
            ['bproof_1'] = -1, ['bproof_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0
        }
    },
    ['ems'] = {
        label = 'EMS Uniform',
        male = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 250, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 86,
            ['pants_1'] = 96, ['pants_2'] = 0,
            ['shoes_1'] = 24, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0,
            ['mask_1'] = -1, ['mask_2'] = 0,
            ['bproof_1'] = -1, ['bproof_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15, ['tshirt_2'] = 0,
            ['torso_1'] = 258, ['torso_2'] = 0,
            ['decals_1'] = 0, ['decals_2'] = 0,
            ['arms'] = 101,
            ['pants_1'] = 99, ['pants_2'] = 0,
            ['shoes_1'] = 24, ['shoes_2'] = 0,
            ['helmet_1'] = -1, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = -1, ['ears_2'] = 0,
            ['mask_1'] = -1, ['mask_2'] = 0,
            ['bproof_1'] = -1, ['bproof_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0
        }
    },
    ['sheriff'] = {
        label = 'Sheriff Uniform',
        male = {
            ['tshirt_1'] = 58, ['tshirt_2'] = 0,
            ['torso_1'] = 55, ['torso_2'] = 0,
            ['decals_1'] = 8, ['decals_2'] = 1,
            ['arms'] = 41,
            ['pants_1'] = 25, ['pants_2'] = 1,
            ['shoes_1'] = 25, ['shoes_2'] = 0,
            ['helmet_1'] = 46, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0,
            ['mask_1'] = -1, ['mask_2'] = 0,
            ['bproof_1'] = -1, ['bproof_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0
        },
        female = {
            ['tshirt_1'] = 35, ['tshirt_2'] = 0,
            ['torso_1'] = 48, ['torso_2'] = 0,
            ['decals_1'] = 7, ['decals_2'] = 1,
            ['arms'] = 44,
            ['pants_1'] = 34, ['pants_2'] = 1,
            ['shoes_1'] = 27, ['shoes_2'] = 0,
            ['helmet_1'] = 45, ['helmet_2'] = 0,
            ['chain_1'] = 0, ['chain_2'] = 0,
            ['ears_1'] = 2, ['ears_2'] = 0,
            ['mask_1'] = -1, ['mask_2'] = 0,
            ['bproof_1'] = -1, ['bproof_2'] = 0,
            ['bags_1'] = -1, ['bags_2'] = 0
        }
    }
}

-- Set to true to enable permission checks
Config.UsePermissions = false

-- Permission groups (only used if Config.UsePermissions = true)
Config.Permissions = {
    ['police'] = 'police',
    ['ems'] = 'ems',
    ['sheriff'] = 'sheriff'
}