local stacks9000 = {}
local stacks9001 = {}
local moves = false

function table.copy(t)
  local t2 = {};
  for k,v in pairs(t) do
    if type(v) == "table" then
        t2[k] = table.copy(v);
    else
        t2[k] = v;
    end
  end
  return t2;
end

local file = io.open(tostring(arg[0]:match('.*/') or "").."LIST.txt")
local lines = file:lines()

for line in lines do
  if line:len() == 0 then
    moves = true
    stacks9001 = table.copy(stacks9000)
    goto continue
  end
  if moves == false then
    for i = 1,line:len(),4 do
        if stacks9000[math.ceil(i/4)] == nil then
          stacks9000[math.ceil(i/4)] = {}
        end
        local stack = line:sub(i,i+3):gsub("%[", ""):gsub("%]", ""):gsub(" ", "")
        if stack:match("[A-Z]") then
          table.insert(stacks9000[math.ceil(i/4)], stack)
        end
    end
    goto continue
  end
  local move, from, to = string.match(line, "move (%d+) from (%d+) to (%d+)")
  for i = 1,move,1 do
    table.insert(stacks9000[tonumber(to)], 1, table.remove(stacks9000[tonumber(from)], 1))
  end
  for i = 1,move,1 do
    table.insert(stacks9001[tonumber(to)], 1, table.remove(stacks9001[tonumber(from)], move-i+1))
  end
  ::continue::
end
for i = 1,#stacks9000,1 do
  io.stdout:write(stacks9000[i][1])
end
print()
for i = 1,#stacks9001,1 do
  io.stdout:write(stacks9001[i][1])
end
print()
