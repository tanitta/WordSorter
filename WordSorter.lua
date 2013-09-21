--ファイル入出力用ハンドルの取得
f = io.open("scripts.txt", "r")
out = io.open("output.txt","w")
data = ""
words = {}

header = 1
footer = 1
for line in f:lines() do
	data = line--stringをdataに代入

	--表示だけ
	if data:find("%a+") ~= nil then
		print(line.."\n")
		while(data:find("%a+") ~= nil)do
			
			
			header,footer = data:find("%a+")
			
			word = data:sub(header,footer)
			
			--既出か検索
			local isNewword = true
			for i = 1, table.getn(words) do
				if words[i].name == word then
					isNewword = false
					break
				end
			end
			
			if isNewword then
				table.insert(words,{num = 1, name = word})
				--print("Newword! : "..words[word].name)
			else
				for index, value in pairs(words) do
					if value.name == word then
						value.num = value.num + 1
					end
				end
				
			end
				
			print(" "..word)
			data = data:sub(footer+1,data:len())
		end
		print(line.."\n\n")
			
	end
	--[[
	while(data:find("%a+") ~= nil) do
		header,footer = data:find("%a+")
		
		word = data:sub(header,footer)
		
		if words[word] == nil then
			words[word] = {num = 1, name = word}
		else
			words[word] = words[word].num + 1
		end
		print(word)
		
		data = data:sub(footer+1,data:len())
		print("data"..data)
		print(data:find("%a+"))
	end
	--]]
end
print("\nSortedWords\n")

func = function(a,b)
	return (a.num > b.num)
end

table.sort(words,func)


for index, value in pairs(words) do
	print(value.name.." "..value.num)
end


