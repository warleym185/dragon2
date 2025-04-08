local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local replicatedStorage = game:GetService("ReplicatedStorage")

-- Modifica o dano do soco
_G.DamageMultiplier = 5 -- Aumente esse número para mais dano

-- Função para modificar o dano do corpo a corpo
function BoostMeleeDamage()
    while true do
        wait(0.1)
        local args = {
            [1] = "punch",
            [2] = Vector3.new(0, 0, 0),
            [3] = _G.DamageMultiplier -- Aplica multiplicador de dano
        }
        replicatedStorage.RemoteEvent:FireServer(unpack(args))
    end
end

-- Expande hitbox para acertar inimigos mais longe
function ExpandHitbox()
    while true do
        wait(0.2)
        for _, enemy in pairs(game.Workspace.NPCs:GetChildren()) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame
                wait(0.1)
            end
        end
    end
end

-- Evita desconexão ao usar script
function AntiKick()
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end

-- Ativar funções
spawn(BoostMeleeDamage)
spawn(ExpandHitbox)
spawn(AntiKick)

print("🔥 Script de aumento de dano corpo a corpo ativado! 🔥")
