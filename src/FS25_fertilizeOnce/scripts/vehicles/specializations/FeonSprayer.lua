-- ---------------------------------------------------------------------------
-- Game: Farming Simulator 25
-- Name: Fertilize Once
-- Version: 1.0.0.0
-- Author: Beaver Bois Modding
-- ---------------------------------------------------------------------------

FeonSprayer = {}

function FeonSprayer.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(Sprayer, specializations)
end

function FeonSprayer.registerOverwrittenFunctions(vehicleType)
    SpecializationUtil.registerOverwrittenFunction(vehicleType, "getSprayerDoubledAmountActive", FeonSprayer.getSprayerDoubledAmountActive)
end

function FeonSprayer:getSprayerDoubledAmountActive(superFunc, sprayTypeIndex)
    local spec = self.spec_sprayer
    if (sprayTypeIndex == nil) then
        return spec.doubledAmountIsActive, true
    else
        local desc = g_sprayTypeManager:getSprayTypeByIndex(sprayTypeIndex)
        if ((desc == nil) or desc.isFertilizer) then
            return spec.doubledAmountIsActive, true
        end
    end

    return false, false
end
