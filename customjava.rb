provides "customjava"

# detect non-provider versions of java on the system
begin
  #customjava = Mash.new

  # start by assuming we don't have java installed
  #customjava[:result1] = false
  customjava "do"

  # see if there's a java binary in the path
  if system("which java  > /dev/null 2>&1") == true
        #customjava[:result2] = true
        customjava "ray"
  end
  # see if there are any procs running
  ps = `ps -C java|grep -v "PID TTY"|wc -l`.to_i
  if ps > 0
    #customjava[:result3] = true
    customjava "me"
  end
  # see if there's anything under /usr/java
  #customjava[:javadirs1] = ["none"]
  if File.directory?("/usr/java") == true
    if Dir.entries("/usr/java").empty? == false
     #customjava[:javadirs2] = Dir.glob("/usr/java/*")
     #customjava[:result4] = true
     customjava "fa"
    end
  end

  # see if JAVA_HOME is set
  #customjava[:java_home1] = "none"
  if ENV['JAVA_HOME'] != nil
        #customjava[:result5] = true
        #customjava[:java_home2] = ENV['JAVA_HOME']
        customjava "so"
  end
rescue Exception => e
  #customjava[:result_err] = e.to_s
  customjava "la"
end
