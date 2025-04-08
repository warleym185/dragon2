local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Configuração
_G.DamageMultiplier = 5

-- Segurança: Verifica se o RemoteEvent existe
local remoteEvent = replicatedStorage:FindFirstChild("RemoteEvent")
if not remoteEvent then
    warn("❌ RemoteEvent não encontrado!")
    return
end

local function BoostMeleeDamage()
    while task.wait(0.1) do
        local args = {
            "punch",
            Vector3.zero,
            _G.DamageMultiplier
        }
        remoteEvent:FireServer(unpack(args))
    end
end

local function ExpandHitbox()
    while task.wait(0.2) do
        for _, enemy in pairs(workspace:WaitForChild("NPCs"):GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                char:WaitForChild("HumanoidRootPart").CFrame = enemy.HumanoidRootPart.CFrame
                task.wait(0.1)
            end
        end
    end
end

local function AntiKick()
    local vu = game:GetService("VirtualUser")
    player.Idled:Connect(function()
        vu:Button2Down(Vector2.zero, workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.zero, workspace.CurrentCamera.CFrame)
    end)
end

task.spawn(BoostMeleeDamage)
task.spawn(ExpandHitbox)
task.spawn(AntiKick)

print("🔥 Script de aumento de dano corpo a corpo ativado! 🔥")
