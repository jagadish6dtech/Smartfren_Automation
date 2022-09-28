*** Setting ***
Documentation   SF Login
Library  AppiumLibrary
Library  SeleniumLibrary
Resource    ../Resource/PageKeywords/Read_TestData_Keyword.robot
Variables    ../Resource/PageObjects/TestData.yaml
Library     OperatingSystem
Library  ../Resource/TestData/ReadDataFromExcel.py
Library  ../Resource/TestData/Provision_Functions.py
Library  ../Resource/TestData/ReadDataFromExcel.py
Library    Collections
Library    String


*** Variables ***
${SMARTFREN_TESTDATA}     ${TestData}[SMARTFREN_TESTDATA]


*** Test Cases ***
TEST CASE 001
   [Documentation]    SF Login
   DeicePairingWithUserID   TC_001  TD_01
   #RegularLogin         TC_001  TD_01


*** Keywords ***
DeicePairingWithUserID
    [Arguments]   ${caseID}  ${dataID}
    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  LoginPage  ${caseID}  ${dataID}
    ${UserID}=  getData  ${data}  UserID
    ${Password}=     getData  ${data}  Password
    ${Password}=     getData  ${data}  Password
    ${X-CoordinatesForFirstClick}=     getData  ${data}  X co-ordinates for first click
    ${Y-CoordinatesForFirstClick}=     getData  ${data}  Y co-ordinates for first click
    ${X co-ordinates for number 1}=     getData  ${data}  X co-ordinates for number 1
    ${Y co-ordinates for number 1}=     getData  ${data}  Y co-ordinates for number 1
    ${X co-ordinates for number 2}=     getData  ${data}  X co-ordinates for number 2
    ${Y co-ordinates for number 2}=     getData  ${data}  Y co-ordinates for number 2
    ${X co-ordinates for number 3}=     getData  ${data}  X co-ordinates for number 3
    ${Y co-ordinates for number 3}=     getData  ${data}  Y co-ordinates for number 3
    ${X co-ordinates for number 4}=     getData  ${data}  X co-ordinates for number 4
    ${Y co-ordinates for number 4}=     getData  ${data}  Y co-ordinates for number 4
    ${X co-ordinates for number 5}=     getData  ${data}  X co-ordinates for number 5
    ${Y co-ordinates for number 5}=     getData  ${data}  Y co-ordinates for number 5
    ${X co-ordinates for number 6}=     getData  ${data}  X co-ordinates for number 6
    ${Y co-ordinates for number 6}=     getData  ${data}  Y co-ordinates for number 6



   Open Application   http://localhost:4723/wd/hub   deviceName=a43e5a75  platformName=Android   platformVersion=11  automationName=UiAutomator2  app=${CURDIR}/app(40).apk  apppackage=com.smartfren.nusantara  appactivity=com.smartfren.nusantara.MainActivity  autoGrantPermissions=true  appWaitActivity=com.smartfren.nusantara.MainActivity
   Sleep  5s
   AppiumLibrary.Click Element    //android.widget.Button[@content-desc="MASUK"]
   #Sleep  2s
   AppiumLibrary.Wait Until Page Contains Element   //android.widget.EditText[@text='User ID' and @index='3']
   AppiumLibrary.Click Element   //android.widget.EditText[@text="User ID" and @index="3"]
   AppiumLibrary.Wait Until Page Contains Element   //android.widget.EditText[@index="3"]
   AppiumLibrary.Input Text      //android.widget.EditText[@index="3"]  ${UserID}
   #Sleep  2s
   AppiumLibrary.Click Element    //android.widget.Button[@content-desc="SELANJUTNYA"]
   AppiumLibrary.Wait Until Page Contains Element    //android.widget.EditText[@text="PIN" and @index="5"]
   AppiumLibrary.Click Element    //android.widget.EditText[@text="PIN" and @index="5"]
   #Sleep  3s
   AppiumLibrary.Input Text    //android.widget.EditText[@index="5"]    ${Password}
   #Sleep  2s
   AppiumLibrary.Click Element    //android.widget.Button[@content-desc="LOGIN"]
   Sleep  3s
   AppiumLibrary.Click Element  //android.view.View[@index='4']
   AppiumLibrary.Click Element  //android.view.View[@index='5']

   AppiumLibrary.Click Element   //android.widget.Button[@content-desc="KIRIM OTP"]
   Sleep  3s
   #Press Keycode   1
   #AppiumLibrary.Click Element At Coordinates     ${X-CoordinatesForFirstClick}    ${Y-CoordinatesForFirstClick}
   Sleep  3s
   #AppiumLibrary.Click Element At Coordinates     ${X co-ordinates for number 1}   ${Y co-ordinates for number 1}
   #Sleep  1s
   #AppiumLibrary.Click Element At Coordinates     ${X co-ordinates for number 2}   ${Y co-ordinates for number 2}
   #Sleep  1s
   #AppiumLibrary.Click Element At Coordinates     ${X co-ordinates for number 3}   ${Y co-ordinates for number 3}
   #Sleep  1s
   #AppiumLibrary.Click Element At Coordinates     ${X co-ordinates for number 4}   ${Y co-ordinates for number 4}
   #Sleep  1s
   #AppiumLibrary.Click Element At Coordinates     ${X co-ordinates for number 5}   ${Y co-ordinates for number 5}
   #Sleep  1s
   #AppiumLibrary.Click Element At Coordinates     ${X co-ordinates for number 6}   ${Y co-ordinates for number 6}
   Sleep  5s
   #AppiumLibrary.Click Element    //android.widget.Button[@content-desc="VERIFIKASI"]
   Sleep  10s
   Close Application




RegularLogin
   [Arguments]   ${caseID}  ${dataID}
    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  LoginPage  ${caseID}  ${dataID}
    ${UserID}=  getData  ${data}  UserID
    ${Password}=     getData  ${data}  Password
    ${Password}=     getData  ${data}  Password

   Open Application   http://localhost:4723/wd/hub  deviceName=a43e5a75  platformName=Android   platformVersion=11  automationName=UiAutomator2  app=${CURDIR}/app(40).apk  apppackage=com.smartfren.nusantara  appactivity=com.smartfren.nusantara.MainActivity  autoGrantPermissions=true  appWaitActivity=com.smartfren.nusantara.MainActivity  appWaitDuration=40000
   Sleep  5s
   AppiumLibrary.Click Element    //android.widget.Button[@content-desc="MASUK"]
   Sleep  2s
   AppiumLibrary.Wait Until Page Contains Element   //android.widget.EditText[@text='User ID' and @index='3']
   AppiumLibrary.Click Element   //android.widget.EditText[@text="User ID" and @index="3"]
   Sleep  2s
   AppiumLibrary.Input Text      //android.widget.EditText[@index="3"]  ${UserID}
   Sleep  2s
   AppiumLibrary.Click Element    //android.widget.Button[@content-desc="SELANJUTNYA"]
   Sleep  5s
   AppiumLibrary.Click Element    //android.widget.EditText[@text="PIN" and @index="5"]
   Sleep  3s
   AppiumLibrary.Input Text    //android.widget.EditText[@index="5"]    ${Password}
   Sleep  2s
   AppiumLibrary.Click Element    //android.widget.Button[@content-desc="LOGIN"]
   Sleep  7s
