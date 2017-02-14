require 'java'
java_import 'burp.IBurpExtender'

class BurpExtender
  include IBurpExtender

	def registerExtenderCallbacks(callbacks)
	
    # set our extension name
    callbacks.setExtensionName("Hello world extension")
    
    # obtain our output and error streams
    stdout = java.io.PrintWriter.new(callbacks.getStdout(), true)
    stderr = java.io.PrintWriter.new(callbacks.getStderr(), true)
    
    # write a message to our output stream
    stdout.println("Hello output")
    
    # write a message to our error stream
    stderr.println("Hello errors")
    
    # write a message to the Burp alerts tab
    callbacks.issueAlert("Hello alerts")
    
    # throw an exception that will appear in our error stream
    raise "Hello exception"
    
  end

end
