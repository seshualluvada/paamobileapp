require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = nil
    #To remove default toolbar uncomment next line:
    @@toolbar = nil
    super


    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # Rho::RhoConnectClient.setObjectNotification("/app/Settings/sync_notify")
    Rho::RhoConnectClient.setNotification('*', "/app/Settings/sync_notify", '')
    
    #@myFileObj = Rho::RhoFile.new('test.txt', Rho::RhoFile::OPEN_FOR_WRITE)
    #@myFileObj.write('http://www.google.com')
    #@myFileObj.close()
    Rho::Log.info(Rho::System.getProperty('platform'),"PLATFORM")

     if (Rho::System.getProperty('platform') == 'ANDROID')
      if (Rho::RhoFile.exists("/mnt/sdcard/Android/data/com.carefusion.carefusionApplications/server.txt"))
         Rho::RhoConfig.start_path = Rho::RhoFile.read("/mnt/sdcard/Android/data/com.carefusion.carefusionApplications/server.txt")
      end
    elsif(Rho::System.getProperty('platform') == 'WINDOWS')
      if (Rho::RhoFile.exists("\\Program Files\\CarefusionApplications\\server.txt"))
         Rho::RhoConfig.start_path = Rho::RhoFile.read("\\Program Files\\CarefusionApplications\\server.txt")
      end   
    end
    Rho::Log.info(Rho::RhoConfig.start_path, "URL")
    
  end
end
