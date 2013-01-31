provides "customant"

# detect non-provider versions of maven on the system
begin
  	customant Mash.new
  	# start by assuming we don't have maven installed
	customant[:result] = false
	customant[:dirs] = ["none"]
	fm = `locate ant.bat |wc -l`.to_i
  	if fm > 0
    	customant[:result] = true
    	md = `locate ant.bat`
    	ad = md.split("\n")
    	arr = []
    	ad.each {|f|
    		first, *rest = f.split(/\/bin/)
    		arr << first
    	}
    	customant[:dirs] = arr
  	end
rescue Exception => e
  	customant[:result] = e.to_s
end