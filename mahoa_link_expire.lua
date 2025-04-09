
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
function decode(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c + (x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local expire_str = decode("MjAyNS0wNS0wOQ==")
local y, m, d = expire_str:match("(%d+)%-(%d+)%-(%d+)")
y, m, d = tonumber(y), tonumber(m), tonumber(d)
local now = os.date("*t")

if now.year > y or (now.year == y and now.month > m) or (now.year == y and now.month == m and now.day > d) then
    gg.alert("Script đã hết hạn. Vui lòng liên hệ để tiếp tục sử dụng.")
    os.exit()
end


local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function decode(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c + (x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local encoded = [==[
CmxvY2FsIHJlcyA9IGdnLm1ha2VSZXF1ZXN0KCJodHRwczovL3Jhdy5naXRodWJ1c2VyY29udGVudC5jb20vVFJVTkcyazlqa2svWnhmZHgvcmVmcy9oZWFkcy9tYWluL2FuaGxfbG9hZGVyLmx1YSIpCmlmIHJlcyBhbmQgcmVzLmNvbnRlbnQgdGhlbgogIGxvY2FsIGYgPSBsb2FkKHJlcy5jb250ZW50KQogIGlmIGYgdGhlbiBmKCkgZW5kCmVsc2UKICBnZy5hbGVydCgiS2jDtG5nIGPDsyBt4bqhbmcgaG/hurdjIGzhu5dpIGtoaSB04bqjaSBzY3JpcHQuIikKZW5kCg==
]==]

local decoded = decode(encoded)
assert(load(decoded))()
