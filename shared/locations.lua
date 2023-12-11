--[[
    ['Innocence'] = {
    settings = {
        label = 'Bennys Motorworks', -- Text label for anything that wants it
        welcomeLabel = "Welcome to Benny's Motorworks!", -- Welcome label in the UI
        enabled = true, -- If the location can be used at all
    },
    blip = {
        label = 'Bennys Motorworks',
        coords = vector3(-205.6992, -1312.7377, 31.1588),
        sprite = 72,
        scale = 0.65,
        color = 0,
        display = 4,
        enabled = true,
    },
    categories = { -- Only include the categories you want. A category not listed defaults to FALSE.
        mods = true, -- Performance Mods
        repair = true,
        armor = true,
        respray = true,
        liveries = true,
        wheels = true,
        tint = true,
        plate = true,
        extras = true,
        neons = true,
        xenons = true,
        horn = true,
        turbo = true,
        cosmetics = true, -- Cosmetic Mods
    },
    drawtextui = {
        text = "Bennys Motorworks",
    },
    restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "any", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        gang = "any", -- Allowed gang. Can be an array of strings for multiple gangs. Any for all gangs
        allowedClasses = {}, -- Array of allowed classes. Empty will allow any but denied classes.
        deniedClasses = {}, -- Array of denied classes.
    },
    zones = {
        { coords = vector3(-212.55, -1320.56, 31.0), length = 6.0, width = 4.0, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
        { coords = vector3(-222.47, -1329.73, 31.0), length = 6.0, width = 4.4, heading = 270.0, minZ = 29.88, maxZ = 33.48 },
    }
},

Vehicle Classes:
0: Compacts     1: Sedans       2: SUVs         3: Coupes       4: Muscle       5: Sports Classics
6: Sports       7: Super        8: Motorcycles  9: Off-road     10: Industrial  11: Utility
12: Vans        13: Cycles      14: Boats       15: Helicopters 16: Planes      17: Service
18: Emergency   19: Military    20: Commercial  21: Trains
 ]]

Config = Config or {}

Config.Locations = {
    ['bennys'] = {
        settings = {
            label = 'Bennys Mekanik',
            welcomeLabel = "Bennys Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'Bennys Mekanik',
            coords = vector3(-205.6992, -1312.7377, 31.1588),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Bennys Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "mechanic1", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(-208.52, -1332.86, 31.13), length = 6.0, width = 4.0, heading = 360.0, minZ = 29.88, maxZ = 33.48 },
            { coords = vector3(-214.07, -1332.94, 31.13), length = 6.0, width = 4.0, heading = 360.0, minZ = 29.88, maxZ = 33.48 },
            { coords = vector3(-222.02, -1332.57, 31.13), length = 6.0, width = 4.0, heading = 360.0, minZ = 29.88, maxZ = 33.48 },
            { coords = vector3(-198.43, -1327.14, 31.13), length = 6.0, width = 4.0, heading = 90.0,  minZ = 29.88, maxZ = 33.48 },

        }
    },
	    ['alpha'] = {
        settings = {
            label = 'Alpha Mekanik',
            welcomeLabel = "Alpha Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'Alpha Mekanik',
            coords = vector3(-335.6, -129.74, 38.54),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Alpha Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "mechanic2", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(-347.77, -157.75, 39.01), length = 6.0, width = 4.0, heading = 340.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-339.95, -160.42, 39.01), length = 6.0, width = 4.0, heading = 340.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-320.99, -156.23, 39.34), length = 6.0, width = 4.0, heading = 70.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-316.94, -145.37, 39.34), length = 6.0, width = 4.0, heading = 70.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-313.3, -134.67, 39.34), length = 6.0, width = 4.0, heading = 70.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-333.17, -133.0, 39.34), length = 6.0, width = 4.0, heading = 159.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-336.59, -105.86, 39.03), length = 6.0, width = 4.0, heading = 335.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-345.27, -102.66, 39.03), length = 6.0, width = 4.0, heading = 335.0, minZ = 35.88, maxZ = 40.48 },
            { coords = vector3(-353.36, -99.48, 39.03), length = 6.0, width = 4.0, heading = 335.0, minZ = 35.88, maxZ = 40.48 },

        }
    },
	
	 ['Super'] = {
        settings = {
            label = 'Winchester Mekanik',
            welcomeLabel = "Winchester Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'Winchester Mekanik',
            coords = vector3(825.36, -972.81, 26.02),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Winchester Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "mechanic3", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(836.7, -970.11, 25.51), length = 6.0, width = 4.0, heading = 90.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(836.69, -960.21, 25.62), length = 6.0, width = 4.0, heading = 90.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(836.81, -950.94, 25.51), length = 6.0, width = 4.0, heading = 90.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(836.85, -940.99, 25.51), length = 6.0, width = 4.0, heading = 90.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(836.73, -931.2, 25.51), length = 6.0, width = 4.0, heading = 90.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(822.08, -932.55, 25.48), length = 6.0, width = 4.0, heading = 180.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(806.55, -931.26, 25.51), length = 6.0, width = 4.0, heading = 270.0, minZ = 22.88, maxZ = 28.48 },
       --     { coords = vector3(806.48, -941.06, 26.44), length = 6.0, width = 4.0, heading = 270.0, minZ = 22.88, maxZ = 28.48 },
            

        }
    },
		['Performans'] = {
        settings = {
            label = 'Performans Mekanik',
            welcomeLabel = "Performans Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'Performans Mekanik',
            coords = vector3(269.82, -1806.39, 26.66),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Performans Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "mechanic4", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(257.36, -1812.82, 26.66), length = 6.0, width = 4.0, heading = 230.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(260.71, -1808.55, 26.66), length = 6.0, width = 4.0, heading = 230.0, minZ = 22.88, maxZ = 28.48 },
            { coords = vector3(280.76, -1808.9, 26.67), length = 6.0, width = 4.0, heading = 50.0, minZ = 22.88, maxZ = 28.48 },
         --   { coords = vector3(269.65, -1801.38, 27.19), length = 6.0, width = 4.0, heading = 140.0, minZ = 22.88, maxZ = 28.48 },
          --  { coords = vector3(266.99, -1798.71, 26.69), length = 6.0, width = 4.0, heading = 140.0, minZ = 22.88, maxZ = 28.48 },
            

        }
    },
	['DreamWork Mekanik'] = {
        settings = {
            label = 'Monaco Mekanik',
            welcomeLabel = "Monaco Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'Monaco Mekanik',
            coords = vector3(-737.97, -1514.29, 5.06),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Monaco Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "mechanic5", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(-726.83, -1517.95, 4.66), length = 6.0, width = 4.0, heading = 112.0, minZ = 2.88, maxZ = 5.48 },
            { coords = vector3(-729.05, -1512.82, 4.66), length = 6.0, width = 4.0, heading = 112.0, minZ = 2.88, maxZ = 5.48 },
            { coords = vector3(-731.28, -1507.68, 4.66), length = 6.0, width = 4.0, heading = 112.0, minZ = 2.88, maxZ = 5.48 },
            { coords = vector3(-758.0, -1530.63, 4.65), length = 6.0, width = 4.0, heading = 22.0, minZ = 2.88, maxZ = 5.48 },
            { coords = vector3(-724.67, -1444.22, 5.0), length = 8.0, width = 8.0, heading = 138.0, minZ = 2.88, maxZ = 9.48 },
        }
    },
				['East Customs'] = {
        settings = {
            label = 'East Customs',
            welcomeLabel = "East Customs'a Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'East Customs',
            coords = vector3(890.42, -2113.77, 29.96),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = true,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "East Customs"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "mechanic6", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(875.95, -2125.12, 29.46), length = 6.0, width = 4.0, heading = 350.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(887.07, -2126.17, 29.46), length = 6.0, width = 4.0, heading = 350.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(897.95, -2127.23, 29.46), length = 6.0, width = 4.0, heading = 350.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(909.11, -2128.24, 29.46), length = 6.0, width = 4.0, heading = 350.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(913.91, -2103.71, 29.46), length = 6.0, width = 4.0, heading = 175.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(903.19, -2103.02, 29.46), length = 6.0, width = 4.0, heading = 175.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(895.97, -2102.35, 29.36), length = 6.0, width = 4.0, heading = 175.0, minZ = 28.88, maxZ = 33.48 },
            { coords = vector3(888.06, -2101.54, 29.36), length = 6.0, width = 4.0, heading = 175.0, minZ = 28.88, maxZ = 33.48 },
            

        }
    },
	['Police'] = {
        settings = {
            label = 'Mekanik',
            welcomeLabel = "Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'Polis Mekanik',
            coords = vector3(-457.82, 6044.13, 31.34),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "police", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,19,20,21}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(-457.82, 6044.13, 31.34), length = 8.0, width = 8.0, heading = 130.0, minZ = 27.80, maxZ = 33.48 },
            { coords = vector3(394.86, -940.38, 22.2), length = 8.0, width = 8.0, heading = 180.0, minZ = 20.80, maxZ = 25.48 },
            { coords = vector3(-381.42, -361.15, 24.05), length = 8.0, width = 8.0, heading = 80.0, minZ = 22.80, maxZ = 26.48 },
        }
    },
	['Lawyer'] = {
        settings = {
            label = 'Mekanik',
            welcomeLabel = "Mekanik'e Hoşgeldiniz",
            enabled = true,
        },
        blip = {
            label = 'DOJ Mekanik',
            coords = vector3(-382.84, 1215.61, 325.64),
            sprite = 72,
            scale = 0.65,
            color = 0,
            display = 4,
            enabled = false,
        },
        categories = {
            mods = true,
            turbo = true,
            repair = true,
            respray = true,
            liveries = true,
            wheels = true,
            tint = true,
            plate = true,
            extras = true,
            neons = true,
            xenons = true,
            horn = true,
            cosmetics = true,
        },
        drawtextui = {
            text = "Mekanik"
        },
		restrictions = { -- A person must pass ALL the restriction checks. Remove an item below to automatically pass that check.
        job = "lawyer", -- Allowed job. Can be an array of strings for multiple jobs. Any for all jobs
        deniedClasses = {}, -- Array of denied classes.
		},
        zones = {
            { coords = vector3(-382.84, 1215.61, 325.64), length = 8.0, width = 8.0, heading = 86.58, minZ = 323.80, maxZ = 327.48 },
        }
    },
}