provides "custommaven"

# detect non-provider versions of maven on the system
begin
  	custommaven Mash.new
  	# start by assuming we don't have maven installed
	custommaven[:result] = false
	custommaven[:mavendirs] = ["none"]
	fm = `locate mvn.bat |wc -l`.to_i
  	if fm > 0
    	custommaven[:result] = true
    	md = `locate mvn.bat`
    	ad = md.split("\n")
    	arr = []
    	ad.each {|f|
    		first, *rest = f.split(/\/bin/)
    		arr << first
    	}
    	custommaven[:mavendirs] = arr
  	end
rescue Exception => e
  	custommaven[:result] = e.to_s
end