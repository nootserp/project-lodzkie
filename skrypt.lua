pcall(
    function()
        local a = game:GetService("Lighting")
        a.Ambient = Color3.fromRGB(255, 255, 255)
        a.Brightness = 1
        a.FogEnd = 1e10
        for b, c in pairs(a:GetDescendants()) do
            if c:IsA("BloomEffect") or c:IsA("BlurEffect") or c:IsA("ColorCorrectionEffect") or c:IsA("SunRaysEffect") then
                c.Enabled = false
            end
        end
        a.Changed:Connect(
            function()
                a.Ambient = Color3.fromRGB(255, 255, 255)
                a.Brightness = 1
                a.FogEnd = 1e10
            end
        )
        spawn(
            function()
                local d = game:GetService("Players").LocalPlayer.Character
                while wait() do
                    repeat
                        wait()
                    until d ~= nil
                    if not d.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                        local e = Instance.new("PointLight", d.HumanoidRootPart)
                        e.Brightness = 1
                        e.Range = 60
                    end
                end
            end
        )
    end
)
local f = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local g =
    f:CreateWindow(
    {
        Name = "project lodzkie",
        LoadingTitle = "project lodzkie",
        LoadingSubtitle = "by notserp",
        ConfigurationSaving = {Enabled = false}
    }
)
local h = g:CreateTab("main", 4483362458)
local i = game:GetService("Players").LocalPlayer
local j = game:GetService("RunService")
local k = game:GetService("TweenService")
local l = game.Workspace.CurrentCamera
local m = CFrame.new(12195.0693359375, 4.618614196777344, -5341.66259765625)
local n =
    CFrame.new(
    6457.09668,
    11.029623,
    -2762.65918,
    -0.901494205,
    0.165899798,
    -0.399731755,
    0,
    0.923613548,
    0.383325309,
    0.432791144,
    0.345565557,
    -0.832632244
)
local o = 1
local p = 5
local q = 0
local r
local s
local function t(d)
    local u
    u =
        j.Stepped:Connect(
        function()
            for v, w in pairs(d:GetDescendants()) do
                if w:IsA("BasePart") then
                    w.CanCollide = false
                end
            end
        end
    )
    return u
end
local function x()
    if i.Character and i.Character:FindFirstChild("Humanoid") then
        i.Character.Humanoid.Health = q
    end
end
local function y(z, A)
    f:Notify({Title = "Czekanie na teleportacje", Content = "Meow", Duration = 10})
    task.wait(10)
    f:Notify({Title = "Teleportowanie do P.D.", Content = "Meow", Duration = 10})
    local d = i.Character or i.CharacterAdded:Wait()
    local B = d:WaitForChild("HumanoidRootPart")
    local C = t(d)
    local D = k:Create(B, TweenInfo.new(A, Enum.EasingStyle.Linear), {CFrame = z})
    D:Play()
    D.Completed:Wait()
    C:Disconnect()
end
local function E()
    while true do
        local F
        local G = math.huge
        local H = i.Character.HumanoidRootPart.Position
        for v, I in ipairs(workspace:GetDescendants()) do
            if I:IsA("ProximityPrompt") and I.Enabled then
                local w = I.Parent
                if w:IsA("BasePart") then
                    local J = (H - w.Position).Magnitude
                    if J < G and J <= I.MaxActivationDistance then
                        F = I
                        G = J
                    end
                end
            end
        end
        if F then
            f:Notify({Title = "Odbieranie paczki", Content = "Meow", Duration = 3})
            fireproximityprompt(F)
        end
        local K = i.PlayerGui:FindFirstChild("CourierJobGui")
        if K and K.Frame.DeliverTo.Text:match("To: %s*(%S+)") then
            return K.Frame.DeliverTo.Text:match("To: (.+)")
        end
        wait(0.5)
    end
end
local function L(M)
    local N = workspace.Jobs.Courier.Locations
    for v, O in ipairs(N:GetChildren()) do
        if O.Name == M then
            return O.PrimaryPart or O:FindFirstChildWhichIsA("BasePart")
        end
    end
end
local function P()
    local Q = 0
    local R = time()
    local u
    if i.Character and i.Character:FindFirstChild("Humanoid") then
        u =
            i.Character.Humanoid.Died:Connect(
            function()
                Q = Q + 1
            end
        )
    end
    while time() - R < p do
        if Q >= o then
            if u then
                u:Disconnect()
            end
            return true
        end
        task.wait()
    end
    if u then
        u:Disconnect()
    end
    x()
    return false
end
local S =
    h:CreateToggle(
    {Name = "auto farma", CurrentValue = false, Flag = "AutoToggle", Callback = function(T)
            _G.Running = T
            if _G.Running then
                while _G.Running do
                    y(m, 10)
                    local U = E()
                    local V = L(U)
                    if V then
                        f:Notify({Title = "ez kasa", Content = "Meow", Duration = 3})
                        i.Character.HumanoidRootPart.CFrame = V.CFrame
                    end
                    P()
                    repeat
                        task.wait()
                    until i.Character and i.Character:FindFirstChild("HumanoidRootPart") and
                        i.Character.Humanoid.Health > 0
                end
            else
                f:Notify({Title = "aha wylaczyles autofarme", Content = "xd", Duration = 3})
            end
        end}
)
f:LoadConfiguration()
