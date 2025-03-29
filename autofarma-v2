local a = game:GetService("Players").LocalPlayer
local b = CFrame.new(12195.0693359375, 4.618614196777344, -5341.66259765625)
local c =
    workspace:FindFirstChild("Jobs") and workspace.Jobs:FindFirstChild("Courier") and
    workspace.Jobs.Courier:FindFirstChild("Locations")
local function d(e)
    local f = e:FindFirstChild("HumanoidRootPart")
    if not f then
        return
    end
    local g, h = nil, math.huge
    for i, j in ipairs(workspace:GetDescendants()) do
        if j:IsA("ProximityPrompt") and j.Enabled then
            local k = j.Parent
            if k:IsA("BasePart") then
                local l = f.Position - k.Position.Magnitude
                if l < h and l <= j.MaxActivationDistance then
                    h = l
                    g = j
                end
            end
        end
    end
    return g
end
local function m()
    local n = a:WaitForChild("PlayerGui")
    local o = n:FindFirstChild("CourierJobGui")
    if not o then
        return nil
    end
    local p = o:FindFirstChild("Frame")
    if not p then
        return nil
    end
    local q = p:FindFirstChild("DeliverTo")
    if q and q:IsA("TextLabel") then
        return q.Text:match("To: (.*)") or "text not found"
    end
    return nil
end
local function r(s)
    if not c then
        return nil
    end
    local t = c:FindFirstChild(s, true)
    if t then
        local u = t:FindFirstChildWhichIsA("BasePart")
        return u and u.CFrame or t:GetModelCFrame()
    end
    return nil
end
local function v(w)
    local e = a.Character or a.CharacterAdded:Wait()
    e:WaitForChild("HumanoidRootPart")
    local x = tick()
    local y = e.HumanoidRootPart
    while tick() - x < 3 do
        if not e.Parent then
            return nil
        end
        y.CFrame = w
        task.wait()
    end
    local j = d(e)
    if not j then
        return nil
    end
    y.CFrame = CFrame.new(y.Position, j.Parent.Position)
    fireproximityprompt(j)
    task.wait(1.5)
    local z = m()
    if not z then
        return nil
    end
    return r(z)
end
task.spawn(
    function()
        while true do
            local e = a.Character or a.CharacterAdded:Wait()
            e:WaitForChild("HumanoidRootPart")
            local A = b
            a.CharacterAdded:Connect(
                function(B)
                    B:WaitForChild("HumanoidRootPart")
                    A = b
                end
            )
            while e.Parent do
                local C, D =
                    pcall(
                    function()
                        local E = v(A)
                        A = E or b
                        if E then
                            print("New target:", E)
                        end
                    end
                )
                if not C then
                    warn("Cycle error:", D)
                    task.wait(2)
                end
            end
        end
    end
)
