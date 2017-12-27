 public static AppiumDriver driver;

    AppiumDriverLocalService service;

    public static WebDriverWait wait;
    String appiumServiceUrl;
    public static DesiredCapabilities capabilities;

    public static SoftAssert softAssert=new SoftAssert();
    public  AppiumDriverLocalService  windowsSystem()
    {
        service = AppiumDriverLocalService
                .buildService(new AppiumServiceBuilder()
                        .usingDriverExecutable(new File("C:\\Program Files\\nodejs\\node.exe"))
                        .withAppiumJS(
                                new File(
                                        "C:\\Users\\USER1\\AppData\\Roaming\\npm\\node_modules\\appium\\build\\lib\\main.js"))
                        .withIPAddress("127.0.0.1").usingPort(4723));

        service.start();
        return service;
    }
    public AppiumDriverLocalService startservice()
    {
      String osName = System.getProperty("os.name");
     if (osName.contains("Mac"))
       { service = AppiumDriverLocalService
                .buildService(new AppiumServiceBuilder()
                        .usingDriverExecutable(new File("/usr/local/bin/node"))
                        .withAppiumJS(
                                new File(
                                        "/usr/local/lib/node_modules/appium/build/lib/main.js"))
                        .withIPAddress("127.0.0.1").usingPort(4723));

        service.start();

        return service;
}
       return windowsSysteem();
    }
    public File setFilepath(String appName) {
        File classpathRoot = new File(System.getProperty("user.dir"));
        File appDir = new File(classpathRoot, "/Apps/folderName/");
        File app = new File(appDir, appName);
        return app;
    }


  public static OS setUpBeforeClass()  {

      String fileName = System.getProperty("platform");
      Logs.info("Reading config file : " + fileName);
      if(fileName.contains("and"))
          return OS.ANDROID;
          else
      if(fileName.equalsIgnoreCase("iOS"))
          return OS.IOS;
      return null;
  }


    public File DataFile()
    {
        Logs.info("setting Config File");
        File classpathRoot = new File(System.getProperty(Data.getdata("class_path")));
        File appDir = new File(classpathRoot, "/DataFile/");
        File configFile=new File(appDir, "abc.xcconfig");
        return  configFile;
    }
 
    @BeforeTest
    public AppiumDriver start() throws Exception
    {
        Main m=new Main();
        String app_name="";
        if(driver!=null)
            return driver;
        appiumServiceUrl= startservice().getUrl().toString();
        System.out.println("URL" + appiumServiceUrl);

        switch (executionOS)
        {
            case ANDROID:
                
                Logs.info("app_name is"+app_name);
                Logs.info("Setting Desired Capabilities");
                capabilities=new DesiredCapabilities();
                
                capabilities.setCapability("app",setFilepath("xxx.apk").getAbsolutePath());
                capabilities.setCapability("automationName", "uiautomator2");
                capabilities.setCapability(CapabilityType.BROWSER_NAME, "Chrome");
                capabilities.setCapability("platformName", "Android");
                capabilities.setCapability( "platformVersion", "5.1.1");
                capabilities.setCapability("appPackage", "com.xxx.xxxx");
                capabilities.setCapability("appActivity", "com.xxx.xxxx");
                capabilities.setCapability("deviceName", "XYZABC");
               // capabilities.setCapability("fullReset","true");
                capabilities.setCapability("noReset","true");
                capabilities.setCapability("recreateChromeDriverSessions", true);
                driver = new AndroidDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);

                driver.manage().timeouts().implicitlyWait(80, TimeUnit.SECONDS);
                GetScreenShot getScr=new GetScreenShot(driver);
                Logs.info("driver got started");

               break;
            case IOS:
                
                Logs.info("Setting Desired Capabilities");
                capabilities=new DesiredCapabilities();
                capabilities.setCapability("app", setFilepath("xxx.ipa"));
                capabilities.setCapability("automationName", "XCUITest");
                capabilities.setCapability( "udid", "f45a0b27aefcc9186322cbf443cdeb0b6d7fb840");
                capabilities.setCapability("platformName", "IOS");
                capabilities.setCapability( "platformVersion", "10.1.1");
                capabilities.setCapability(    "xcodeConfigFile", "/Users/mariappan/Desktop/abc.xcconfig");
                capabilities.setCapability("deviceName", "fbhtytXXXXXXXXXXXXXXXXX");
                capabilities.setCapability("usePrebuiltWDA",false);
                driver = new IOSDriver(new URL("http://127.0.0.1:4723/wd/hub"), capabilities);
                driver.manage().timeouts().implicitlyWait(80, TimeUnit.SECONDS);
                GetScreenShot getScreenShot=new GetScreenShot(driver);
                Logs.info("driver got started");




        }
        wait=new WebDriverWait(driver,60);
        return driver;
    }
