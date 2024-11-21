-- ---------------------------------------------------------------------------
-- Game: Farming Simulator 25
-- Name: Fertilize Once
-- Version: 1.0.0.0
-- Author: Beaver Bois Modding
-- ---------------------------------------------------------------------------

local modName = g_currentModName

local function Sprayer_onLoad(instance, superFunc, savegame)
    instance.xmlFile:setValue("vehicle.sprayer.doubledAmount#decreaseFactor", 1.0)

    superFunc(instance, savegame)

    local spec = instance.spec_sprayer
    spec.doubledAmountIsActive = true
end

local function TypeManager_preValidateTypes(instance)
    if (instance.typeName ~= "vehicle") then
        return
    end

    for name, type in pairs(instance:getTypes()) do
        if (type.specializationsByName["sprayer"] ~= nil) then
            instance:addSpecialization(name, ("%s.feonSprayer"):format(modName))
        end
    end
end

Sprayer.onLoad = Utils.overwrittenFunction(Sprayer.onLoad, Sprayer_onLoad)
TypeManager.validateTypes = Utils.prependedFunction(TypeManager.validateTypes, TypeManager_preValidateTypes)
