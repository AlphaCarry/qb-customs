-----------------------
----   Variables   ----
-----------------------
local currentMenuItemID = 0
local currentMenuItem = ""
local currentMenuItem2 = ""
local currentMenu = "mainMenu"
local currentCategory = 0
local currentResprayCategory = 0
local currentResprayType = 0
local currentWheelCategory = 0
local currentNeonSide = 0


-----------------------
----   Functions   ----
-----------------------

local function toggleMenuContainer(state)
    SendNUIMessage({
        toggleMenuContainer = true,
        state = state
    })
end

local function createMenu(menu, heading, subheading)
    SendNUIMessage({
        createMenu = true,
        menu = menu,
        heading = heading,
        subheading = subheading
    })
end

local function destroyMenus()
    SendNUIMessage({
        destroyMenus = true
    })
end

local function populateMenu(menu, id, item, item2)
    SendNUIMessage({
        populateMenu = true,
        menu = menu,
        id = id,
        item = item,
        item2 = item2
    })
end

local function finishPopulatingMenu(menu)
    SendNUIMessage({
        finishPopulatingMenu = true,
        menu = menu
    })
end

local function updateMenuHeading(menu)
    SendNUIMessage({
        updateMenuHeading = true,
        menu = menu
    })
end

local function updateMenuSubheading(menu)
    SendNUIMessage({
        updateMenuSubheading = true,
        menu = menu
    })
end

local function updateMenuStatus(text)
    SendNUIMessage({
        updateMenuStatus = true,
        statusText = text
    })
end

local function toggleMenu(state, menu)
    SendNUIMessage({
        toggleMenu = true,
        state = state,
        menu = menu
    })
end

local function updateItem2Text(menu, id, text)
    SendNUIMessage({
        updateItem2Text = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function updateItem2TextOnly(menu, id, text)
    SendNUIMessage({
        updateItem2TextOnly = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function scrollMenuFunctionality(direction, menu)
    SendNUIMessage({
        scrollMenuFunctionality = true,
        direction = direction,
        menu = menu
    })
end

local function playSoundEffect(soundEffect, volume)
    SendNUIMessage({
        playSoundEffect = true,
        soundEffect = soundEffect,
        volume = volume
    })
end

local function isMenuActive(menu)
    local menuActive = false

    if menu == "modMenu" then
        for _, v in pairs(vehicleCustomisation) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "BoyamaMenu" then
        for _, v in pairs(vehicleResprayOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "JantMenu" then
        for _, v in pairs(vehicleWheelOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    elseif menu == "NeonsSideMenu" then
        for _, v in pairs(vehicleNeonOptions.neonTypes) do
            if (v.name:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true

                break
            else
                menuActive = false
            end
        end
    end

    return menuActive
end

local function updateCurrentMenuItemID(id, item, item2)
    currentMenuItemID = id
    currentMenuItem = item
    currentMenuItem2 = item2

    if isMenuActive("modMenu") then
        if currentCategory ~= 18 then
            PreviewMod(currentCategory, currentMenuItemID)
        end
    elseif isMenuActive("BoyamaMenu") then
        PreviewColour(currentResprayCategory, currentResprayType, currentMenuItemID)
    elseif isMenuActive("JantMenu") then
        if currentWheelCategory ~= -1 and currentWheelCategory ~= 20 then
            PreviewWheel(currentCategory, currentMenuItemID, currentWheelCategory)
        end
    elseif isMenuActive("NeonsSideMenu") then
        PreviewNeon(currentNeonSide, currentMenuItemID)
    elseif currentMenu == "CamFilmiMenu" then
        PreviewWindowTint(currentMenuItemID)
    elseif currentMenu == "NeonRengiMenu" then
        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b

        PreviewNeonColour(r, g, b)
    elseif currentMenu == "XenonRenkleriMenu" then
        PreviewXenonColour(currentMenuItemID)
    elseif currentMenu == "StickerMenu" then
        PreviewOldLivery(currentMenuItemID)
    elseif currentMenu == "PlakaMenu" then
        PreviewPlateIndex(currentMenuItemID)
    end
end

function InitiateMenus(isMotorcycle, vehicleHealth, categories, welcomeLabel)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    --#[Repair Menu]#--
    if vehicleHealth < 1000.0 and categories.repair then
        local repairCost = math.ceil(1000 - vehicleHealth)

        TriggerServerEvent("qb-customs:server:updateRepairCost", repairCost)
        createMenu("repairMenu", welcomeLabel, "Aracı Tamir Et")
        populateMenu("repairMenu", -1, "Tamir Et", "$" .. repairCost)
        finishPopulatingMenu("repairMenu")
    end

    --#[Main Menu]#--
    createMenu("mainMenu", welcomeLabel, "Bir Kategori Seç")

    for _, v in ipairs(vehicleCustomisation) do
        local _, amountValidMods = CheckValidMods(v.category, v.id)

        if amountValidMods > 0 or v.id == 18 then
            if (v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15) then
                if categories.mods and maxVehiclePerformanceUpgrades ~= -1 then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 16 then
                if categories.armor then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 14 then
                if categories.horn then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 18 then
                if categories.turbo then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            elseif v.id == 48 then
                if categories.liveries then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            else
                if categories.cosmetics then
                    populateMenu("mainMenu", v.id, v.category, "none")
                end
            end
        end
    end

    if categories.respray then populateMenu("mainMenu", -1, "Boyama", "none") end

    if not isMotorcycle then
        if categories.tint then populateMenu("mainMenu", -2, "Cam Filmi", "none") end
        if categories.neons then populateMenu("mainMenu", -3, "Neon Modifiyesi", "none") end
    end

    if categories.xenons then populateMenu("mainMenu", 22, "Xenon", "none") end
    if categories.wheels then populateMenu("mainMenu", 23, "Jant", "none") end

    local livCount = GetVehicleLiveryCount(plyVeh)
    if livCount > 0 and categories.liveries then
        populateMenu("mainMenu", 24, "Sticker", "none")
    end

    if categories.plate then populateMenu("mainMenu", 25, "Plaka", "none") end
    if categories.extras then populateMenu("mainMenu", 26, "Ekstralar", "none") end

    finishPopulatingMenu("mainMenu")

    --#[Mods Menu]#--
    for _, v in ipairs(vehicleCustomisation) do
        local validMods, amountValidMods = CheckValidMods(v.category, v.id)
        local currentMod, _ = GetCurrentMod(v.id)
		local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
--		print(vehiclename)
--		print(vehiclename2)
		local vehiclePrice = vehicleprices[vehiclename2]['price']

        if amountValidMods > 0 or v.id == 18 then
            if v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15 or v.id == 16 then --Performance Upgrades
                local tempNum = 0

                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Yükseltme Seç")

                for _, n in pairs(validMods) do
                    tempNum = tempNum + 1

                    if maxVehiclePerformanceUpgrades == 0 then
                        populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehiclePrice*vehicleCustomisationPrices.performance.prices[tempNum]//75)

                        if currentMod == n.id then
                            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Mevcut")
                        end
                    else
                        if tempNum <= (maxVehiclePerformanceUpgrades + 1) then
                            populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehiclePrice*vehicleCustomisationPrices.performance.prices[tempNum]//75)

                            if currentMod == n.id then
                                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Mevcut")
                            end
                        end
                    end
                end

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            elseif v.id == 18 then
                local currentTurboState = GetCurrentTurboState()
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Modifiyesi", "Torboyu Aç/Kapat")

                populateMenu(v.category:gsub("%s+", "") .. "Menu", -1, "Kapat", "$0")
                populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Aç", "$" .. vehiclePrice*vehicleCustomisationPrices.turbo.prices[2]//75)

                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentTurboState, "Mevcut")

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            else
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Modifiyesi", "Mod Seç")

                for _, n in pairs(validMods) do
                    populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehiclePrice*vehicleCustomisationPrices.cosmetics.price//600)

                    if currentMod == n.id then
                        updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Mevcut")
                    end
                end

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            end
        end
    end

    --#[Respray Menu]#--
    createMenu("BoyamaMenu", "Boyama", "Kategori Seç")

    populateMenu("BoyamaMenu", 0, "Birinci Renk", "none")
    populateMenu("BoyamaMenu", 1, "İkinci Renk", "none")
    populateMenu("BoyamaMenu", 2, "Yaldız Rengi", "none")
    populateMenu("BoyamaMenu", 3, "Jant Rengi", "none")
    populateMenu("BoyamaMenu", 4, "Döşeme Rengi", "none")
    populateMenu("BoyamaMenu", 5, "Gösterge Rengi", "none")

    finishPopulatingMenu("BoyamaMenu")

    --#[Respray Types]#--
    createMenu("ResprayTypeMenu", "Renk Tipi", "Renk Tipi Seç")

    for _, v in ipairs(vehicleResprayOptions) do
        populateMenu("ResprayTypeMenu", v.id, v.category, "none")
    end

    finishPopulatingMenu("ResprayTypeMenu")

    --#[Respray Colours]#--
    for _, v in ipairs(vehicleResprayOptions) do
	local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
        createMenu(v.category .. "Menu", v.category .. " Renkler", "Renk Seç")

        for _, n in ipairs(v.colours) do
            populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehiclePrice*vehicleCustomisationPrices.respray.price//600)
        end

        finishPopulatingMenu(v.category .. "Menu")
    end

    --#[Wheel Categories Menu]#--
    createMenu("JantMenu", "Jant", "Kategori Seç")

    for _, v in ipairs(vehicleWheelOptions) do
        if isMotorcycle then
            if v.id == -1 or v.id == 20 or v.id == 6 then --Motorcycle Wheels
                populateMenu("JantMenu", v.id, v.category, "none")
            end
        else
            populateMenu("JantMenu", v.id, v.category, "none")
        end
    end

    finishPopulatingMenu("JantMenu")

    --#[Wheels Menu]#--
    for _, v in ipairs(vehicleWheelOptions) do
        if v.id == -1 then
            local currentCustomWheelState = GetCurrentCustomWheelState()
			local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
            createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Özel Jantları Aç/Kapat")

            populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Kapat", "$0")
            populateMenu(v.category:gsub("%s+", "") .. "Menu", 1, "Aç", "$" .. vehiclePrice*vehicleCustomisationPrices.customwheels.price//600)

            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentCustomWheelState, "Mevcut")

            finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
        elseif v.id ~= 20 then
            if isMotorcycle then
                if v.id == 6 then --Motorcycle Wheels
                    local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)
					local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']

                    createMenu(v.category .. "Menu", v.category .. " Jantlar", "Jant Seç")

                    for _, n in pairs(validMods) do
                        populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehiclePrice*vehicleCustomisationPrices.wheels.price//600)
                    end

                    finishPopulatingMenu(v.category .. "Menu")
                end
            else
                local validMods, _ = CheckValidMods(v.category, v.wheelID, v.id)
				local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']

                createMenu(v.category .. "Menu", v.category .. " Jantlar", "Jant Seç")

                for _, n in pairs(validMods) do
                    populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehiclePrice*vehicleCustomisationPrices.wheels.price//600)
                end

                finishPopulatingMenu(v.category .. "Menu")
            end
        end
    end

    --#[Wheel Smoke Menu]#--
    local currentWheelSmokeR, currentWheelSmokeG, currentWheelSmokeB = GetCurrentVehicleWheelSmokeColour()
	local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
    createMenu("LastikDumanıMenu", "Lastik Dumanı", "Renk Seç")

    for k, v in ipairs(vehicleTyreSmokeOptions) do
        populateMenu("LastikDumanıMenu", k, v.name, "$" .. vehiclePrice*vehicleCustomisationPrices.wheelsmoke.price//600)

        if v.r == currentWheelSmokeR and v.g == currentWheelSmokeG and v.b == currentWheelSmokeB then
            updateItem2Text("LastikDumanıMenu", k, "Mevcut")
        end
    end

    finishPopulatingMenu("LastikDumanıMenu")

    --#[Window Tint Menu]#--
    local currentWindowTint = GetCurrentWindowTint()
	local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
	local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
    createMenu("CamFilmiMenu", "Cam Filmi", "Cam Filmi Seç")

    for _, v in ipairs(vehicleWindowTintOptions) do
        populateMenu("CamFilmiMenu", v.id, v.name, "$" .. vehiclePrice*vehicleCustomisationPrices.windowtint.price//600)

        if currentWindowTint == v.id then
            updateItem2Text("CamFilmiMenu", v.id, "Mevcut")
        end
    end

    finishPopulatingMenu("CamFilmiMenu")

    --#[Old Livery Menu]#--
    if livCount > 0 then
        local tempOldLivery = GetVehicleLivery(plyVeh)
		local currentWindowTint = GetCurrentWindowTint()
	local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
	local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
        createMenu("StickerMenu", "Kaplama", "Kaplama Seç")
        for i=0, livCount-1 do
            populateMenu("StickerMenu", i, "Kaplama", "$" ..vehiclePrice*vehicleCustomisationPrices.oldlivery.price//600)
            if tempOldLivery == i then
                updateItem2Text("StickerMenu", i, "Mevcut")
            end
        end
        finishPopulatingMenu("StickerMenu")
    end

    --#[Plate Colour Index Menu]#--

    local tempPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
	local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
	local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
    createMenu("PlakaMenu", "Plaka", "Plaka Seç")
    local plateTypes = {
        "Beyaz-Mavi #1",
        "Siyah-Sarı",
        "Mavi-Sarı",
        "Beyaz-Mavi #2",
        "Beyaz-Mavi #3",
        "North Yankton",
    }
    for i=0, #plateTypes-1 do
        if i ~= 4 or (i == 4 and GetVehicleClass(plyVeh) == 18) or Config.allowGovPlateIndex then
            populateMenu("PlakaMenu", i, plateTypes[i+1], "$"..vehiclePrice*vehicleCustomisationPrices.plateindex.price//600)
            if tempPlateIndex == i then
                updateItem2Text("PlakaMenu", i, "Mevcut")
            end
        end
    end
    finishPopulatingMenu("PlakaMenu")

    --#[Vehicle Extras Menu]#--
    createMenu("EkstralarMenu", "Ekstralar", "Ekstra Seç")
    for i=1, 12 do
        if DoesExtraExist(plyVeh, i) then
            populateMenu("EkstralarMenu", i, "Ekstra "..tostring(i), "Var")
        else
            populateMenu("EkstralarMenu", i, "Seçenek Yok", "YOK")
        end
    end
    finishPopulatingMenu("EkstralarMenu")

    --#[Neons Menu]#--
    createMenu("NeonModifiyesiMenu", "Neon Modifiyesi", "Kategori Seç")

    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        populateMenu("NeonModifiyesiMenu", v.id, v.name, "none")
    end

    populateMenu("NeonModifiyesiMenu", -1, "Neon Rengi", "none")
    finishPopulatingMenu("NeonModifiyesiMenu")

    --#[Neon State Menu]#--
    for _, v in ipairs(vehicleNeonOptions.neonTypes) do
        local currentNeonState = GetCurrentNeonState(v.id)
		local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
        createMenu(v.name:gsub("%s+", "") .. "Menu", "Neon Modifiyesi", "Neonu Aç/Kapat")

        populateMenu(v.name:gsub("%s+", "") .. "Menu", 0, "Kapalı", "$0")
        populateMenu(v.name:gsub("%s+", "") .. "Menu", 1, "Açık", "$" .. vehiclePrice*vehicleCustomisationPrices.neonside.price//600)

        updateItem2Text(v.name:gsub("%s+", "") .. "Menu", currentNeonState, "Mevcut")

        finishPopulatingMenu(v.name:gsub("%s+", "") .. "Menu")
    end

    --#[Neon Colours Menu]#--
    local currentNeonR, currentNeonG, currentNeonB = GetCurrentNeonColour()
    createMenu("NeonRengiMenu", "Neon Rengi", "Renk Seç")

    for k, _ in ipairs(vehicleNeonOptions.neonColours) do
        populateMenu("NeonRengiMenu", k, vehicleNeonOptions.neonColours[k].name, "$" .. vehiclePrice*vehicleCustomisationPrices.neoncolours.price//600)

        if currentNeonR == vehicleNeonOptions.neonColours[k].r and currentNeonG == vehicleNeonOptions.neonColours[k].g and currentNeonB == vehicleNeonOptions.neonColours[k].b then
            updateItem2Text("NeonRengiMenu", k, "Mevcut")
        end
    end

    finishPopulatingMenu("NeonRengiMenu")

    --#[Xenons Menu]#--
    createMenu("XenonMenu", "Xenon", "Kategori Seç")

    populateMenu("XenonMenu", 0, "Far", "none")
    populateMenu("XenonMenu", 1, "Xenon Renkleri", "none")

    finishPopulatingMenu("XenonMenu")

    --#[Xenons Headlights Menu]#--
    local currentXenonState = GetCurrentXenonState()
	local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']
    createMenu("FarMenu", "Far Modifiyesi", "Xenon Aç/Kapat")

    populateMenu("FarMenu", 0, "Xenon Kapat", "$0")
    populateMenu("FarMenu", 1, "Xenon Aç", "$" .. vehiclePrice*vehicleCustomisationPrices.headlights.price//600)

    updateItem2Text("FarMenu", currentXenonState, "Mevcut")

    finishPopulatingMenu("FarMenu")

    --#[Xenons Colour Menu]#--
    local currentXenonColour = GetCurrentXenonColour()
    createMenu("XenonRenkleriMenu", "Xenon Renkleri", "Renk Seç")

    for _, v in ipairs(vehicleXenonOptions.xenonColours) do
        populateMenu("XenonRenkleriMenu", v.id, v.name, "$" .. vehiclePrice*vehicleCustomisationPrices.xenoncolours.price//600)

        if currentXenonColour == v.id then
            updateItem2Text("XenonRenkleriMenu", v.id, "Mevcut")
        end
    end

    finishPopulatingMenu("XenonRenkleriMenu")
end

function DestroyMenus()
    destroyMenus()
end

function DisplayMenuContainer(state)
    toggleMenuContainer(state)
end

function DisplayMenu(state, menu)
    if state then
        currentMenu = menu
    end

    toggleMenu(state, menu)
    updateMenuHeading(menu)
    updateMenuSubheading(menu)
end

function MenuManager(state, repairOnly)
    if state then
        if currentMenuItem2 ~= "Installed" then
            if isMenuActive("modMenu") then
                if currentCategory == 18 then --Turbo
                    if AttemptPurchase("turbo", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok!")
                    end
                elseif currentCategory == 11 or currentCategory == 12 or currentCategory== 13 or currentCategory == 15 or currentCategory == 16 then --Performance Upgrades
                    if AttemptPurchase("performance", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                else
                    if AttemptPurchase("cosmetics") then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                end
            elseif isMenuActive("BoyamaMenu") then
                if AttemptPurchase("respray") then
                    ApplyColour(currentResprayCategory, currentResprayType, currentMenuItemID)
                    playSoundEffect("respray", 1.0)
                    updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                    updateMenuStatus("Satın Alındı")
                else
                    updateMenuStatus("Yeterli Paran Yok")
                end
            elseif isMenuActive("JantMenu") then
                if currentWheelCategory == 20 then
                    if AttemptPurchase("wheelsmoke") then
                        local r = vehicleTyreSmokeOptions[currentMenuItemID].r
                        local g = vehicleTyreSmokeOptions[currentMenuItemID].g
                        local b = vehicleTyreSmokeOptions[currentMenuItemID].b

                        ApplyTyreSmoke(r, g, b)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satın Alındı")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                else
                    if currentWheelCategory == -1 then --Custom Wheels
                        local currentWheel = GetCurrentWheel()

                        if currentWheel == -1 then
                            updateMenuStatus("Stok Tekerleklerine Özel Jantlar Uygulanamıyor")
                        else
                            if AttemptPurchase("customwheels") then
                                ApplyCustomWheel(currentMenuItemID)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                                updateMenuStatus("Satın Alındı")
                            else
                                updateMenuStatus("Yeterli Paran Yok")
                            end
                        end
                    else
                        local currentWheel = GetCurrentWheel()
                        local currentCustomWheelState = GetOriginalCustomWheel()

                        if currentCustomWheelState and currentWheel == -1 then
                            updateMenuStatus("Stok Tekerleklerine Özel Jantlar Uygulanamıyor")
                        else
                            if AttemptPurchase("wheels") then
                                ApplyWheel(currentCategory, currentMenuItemID, currentWheelCategory)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                                updateMenuStatus("Satın Alındı")
                            else
                                updateMenuStatus("Yeterli Paran Yok")
                            end
                        end
                    end
                end
            elseif isMenuActive("NeonsSideMenu") then
                if AttemptPurchase("neonside") then
                    ApplyNeon(currentNeonSide, currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                    updateMenuStatus("Satın Alındı")
                else
                    updateMenuStatus("Yeterli Paran Yok")
                end
            else
                if currentMenu == "repairMenu" then
                    if AttemptPurchase("repair") then
                        currentMenu = "mainMenu"

                        RepairVehicle()

                        if not repairOnly then
                            toggleMenu(false, "repairMenu")
                            toggleMenu(true, currentMenu)
                        else
                            ExitBennys()
                            QBCore.Functions.Notify('Araç tamir edildi')
                        end
                        updateMenuHeading(currentMenu)
                        updateMenuSubheading(currentMenu)
                        playSoundEffect("wrench", 0.4)
                        updateMenuStatus("")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "mainMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentCategory = currentMenuItemID

                    toggleMenu(false, "mainMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "BoyamaMenu" then
                    currentMenu = "ResprayTypeMenu"
                    currentResprayCategory = currentMenuItemID

                    toggleMenu(false, "BoyamaMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "ResprayTypeMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentResprayType = currentMenuItemID

                    toggleMenu(false, "ResprayTypeMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "JantMenu" then
                    local currentWheel, _, currentWheelType = GetCurrentWheel()

                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentWheelCategory = currentMenuItemID

                    if currentWheelType == currentWheelCategory then
                        updateItem2Text(currentMenu, currentWheel, "Mevcut")
                    end

                    toggleMenu(false, "JantMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "NeonModifiyesiMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentNeonSide = currentMenuItemID

                    toggleMenu(false, "NeonModifiyesiMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "XenonMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"

                    toggleMenu(false, "XenonMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "CamFilmiMenu" then
                    if AttemptPurchase("windowtint") then
                        ApplyWindowTint(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "NeonRengiMenu" then
                    if AttemptPurchase("neoncolours") then
                        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
                        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
                        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b

                        ApplyNeonColour(r, g, b)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "FarMenu" then
                    if AttemptPurchase("headlights") then
                        ApplyXenonLights(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "XenonRenkleriMenu" then
                    if AttemptPurchase("xenoncolours") then
                        ApplyXenonColour(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "StickerMenu" then
                    if AttemptPurchase("oldlivery") then
                        ApplyOldLivery(currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "PlakaMenu" then
                    if AttemptPurchase("plateindex") then
                        ApplyPlateIndex(currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Purchased")
                    else
                        updateMenuStatus("Yeterli Paran Yok")
                    end
                elseif currentMenu == "EkstralarMenu" then
                    ApplyExtra(currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2TextOnly(currentMenu, currentMenuItemID, "Mevcut")
                    updateMenuStatus("Purchased")
                end
            end
        else
            if currentMenu == "EkstralarMenu" then
                ApplyExtra(currentMenuItemID)
                playSoundEffect("wrench", 0.4)
                updateItem2TextOnly(currentMenu, currentMenuItemID, "Mevcut")
                updateMenuStatus("Purchased")
            end
        end
    else
        updateMenuStatus("")

        if isMenuActive("modMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "mainMenu"

            if currentCategory ~= 18 then
                RestoreOriginalMod()
            end

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("BoyamaMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "ResprayTypeMenu"

            RestoreOriginalColours()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("JantMenu") then
            if currentWheelCategory ~= 20 and currentWheelCategory ~= -1 then
                local currentWheel = GetOriginalWheel()
				local vehicle = GetEntityModel(GetVehiclePedIsIn(PlayerPedId()))
		local vehiclename = GetDisplayNameFromVehicleModel(vehicle)
		local vehiclename2 = vehiclename:lower()
		local vehiclePrice = vehicleprices[vehiclename2]['price']

                updateItem2Text(currentMenu, currentWheel, "$" .. vehiclePrice*vehicleCustomisationPrices.wheels.price//600)

                RestoreOriginalWheels()
            end

            toggleMenu(false, currentMenu)

            currentMenu = "JantMenu"


            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("NeonsSideMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "NeonModifiyesiMenu"

            RestoreOriginalNeonStates()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        else
            if currentMenu == "mainMenu" or currentMenu == "repairMenu" then
                ExitBennys()
            elseif currentMenu == "BoyamaMenu" or currentMenu == "CamFilmiMenu" or currentMenu == "JantMenu" or currentMenu == "NeonModifiyesiMenu" or currentMenu == "XenonMenu" or currentMenu == "StickerMenu" or currentMenu == "PlakaMenu" or currentMenu == "EkstralarMenu" then
                toggleMenu(false, currentMenu)

                if currentMenu == "CamFilmiMenu" then
                    RestoreOriginalWindowTint()
                end

                if currentMenu == "StickerMenu" then
                    RestoreOldLivery()
                end
                if currentMenu == "PlakaMenu" then
                    RestorePlateIndex()
                end

                currentMenu = "mainMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "ResprayTypeMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "BoyamaMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "NeonRengiMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "NeonModifiyesiMenu"

                RestoreOriginalNeonColours()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "FarMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "XenonRenkleriMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonMenu"

                RestoreOriginalXenonColour()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            end
        end
    end
end

function MenuScrollFunctionality(direction)
    scrollMenuFunctionality(direction, currentMenu)
end

-----------------------
----   Threads     ----
-----------------------

-----------------------
---- Client Events ----
-----------------------

RegisterNUICallback("selectedItem", function(data, cb)
    updateCurrentMenuItemID(tonumber(data.id), data.item, data.item2)
    cb("ok")
end)

RegisterNUICallback("updateItem2", function(data, cb)
    currentMenuItem2 = data.item
    cb("ok")
end)
