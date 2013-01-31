provides "customjava"

# detect non-provider versions of java on the system
begin
  customjava Mash.new

  # start by assuming we don't have java installed
  customjava[:result] = false
  #customjava "do"

  # see if there's a java binary in the path
  if system("which java  > /dev/null 2>&1") == true
        customjava[:result] = true
        #customjava "ray"
  end
  # see if there are any procs running
  ps = `ps -C java|grep -v "PID TTY"|wc -l`.to_i
  if ps > 0
    customjava[:result] = true
    #customjava "me"
  end
  # see if there's anything under /usr/java
  customjava[:dirs] = ["none"]
  if File.directory?("/usr/java") == true
    if Dir.entries("/usr/java").empty? == false
     customjava[:dirs] = Dir.glob("/usr/java/*")
     customjava[:result] = true
     #customjava "fa"
    end
  end

  # see if JAVA_HOME is set
  customjava[:java_home] = "none"
  if ENV['JAVA_HOME'] != nil
        customjava[:result] = true
        customjava[:java_home] = ENV['JAVA_HOME']
        #customjava "so"
  end
rescue Exception => e
  customjava[:result] = e.to_s
  #customjava "la"
end
