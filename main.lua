local function Multiply(qv1, qv2)
    return{
        x = qv1.w * qv2.x + qv1.x * qv2.w + qv1.y * qv2.z - qv1.z * qv2.y,
        y = qv1.w * qv2.y - qv1.x * qv2.z + qv1.y * qv2.w + qv1.z * qv2.x,
        z = qv1.w * qv2.z + qv1.x * qv2.y - qv1.y * qv2.x + qv1.z * qv2.w,
        w = qv1.w * qv2.w - qv1.x * qv2.x - qv1.y * qv2.y - qv1.z * qv2.z
    }
end

local function QuatInv(qv)
    return{
        x = -qv.x,
        y = -qv.y,
        z = -qv.z,
        w = qv.w
    }
end

local function QuatFromAx(axis, angle)
    local Sin = math.sin(angle / 2)
    local Cos = math.cos(angle / 2)
    return{
        x = axis.x * Sin,
        y = axis.y * Sin,
        z = axis.z * Sin,
        w = Cos
    }
end

local function Rotate(vector, quat)
    local VecQuat = { x = vector.x, y = vector.y, z = vector.z, w = 0 }
    local QuatConj = QuatInv(quat)
    local ResultQuat = Multiply(Multiply(quat, VecQuat), QuatConj)
    return{
        x = ResultQuat.x,
        y = ResultQuat.y,
        z = ResultQuat.z
    }
end

local Vector = {x = 0, y = 1, z = 2}
local Angle = 90
local AngleRad = math.rad(Angle)
local Axis = {x = 0, y = 0, z = 1}
local RotationQuat = QuatFromAx(Axis, AngleRad)
local RotatedVector = Rotate(Vector, RotationQuat)

print("Original Vector:")
print(string.format("%f, %f, %f", Vector.x, Vector.y, Vector.z))
print("Rotated Vector:")
print(string.format("%f, %f, %f", RotatedVector.x, RotatedVector.y, RotatedVector.z))
