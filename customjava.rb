provides "customjava"

# detect non-provider versions of java on the system

customjava = Mash.new

# start by assuming we don't have java installed
customjava[:result] = false

# see if there's a java binary in the path
if system("which java  > /dev/null 2>&1") == true
        customjava[:result] = true
end
# see if there are any procs running
ps = `ps -C java`
ps.each do |i|
        if i=~ /java/
                customjava["result"] = true
        end
end
# see if there's anything under /usr/java
javadirs = ["none"]
if File.directory?("/usr/java") == true
  if Dir.entries("/usr/java").empty? == false
     customjava["javadirs"] = Dir.glob("/usr/java/*")
     customjava[:result] = true
  end
end
#customjava[:javadirs] = javadirs

# see if JAVA_HOME is set
javahome = "none"
if ENV['JAVA_HOME'] != nil
        customjava[:result] = true
        javahome = ENV['JAVA_HOME']
end
customjava["java_home"] = javahome
