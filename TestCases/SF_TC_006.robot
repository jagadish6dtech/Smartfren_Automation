*** Settings ***
Documentation   Sample TestCase For Automation FrameWork
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Resource/PageKeywords/SF_Login_Keyword.robot
Resource    ../Resource/PageKeywords/SF_UI_Keywords.robot


Resource    ../Resource/PageKeywords/Read_TestData_Keyword.robot
Library  ../Resource/TestData/Provision_Functions.py
Library  ../Resource/TestData/ReadDataFromExcel.py

Variables    ../Resource/PageObjects/PageObjects.yaml
Variables    ../Resource/PageObjects/TestData.yaml
Resource     ../Resource/PageKeywords/Common.robot
Resource    ../Resource/PageKeywords/tmp/LoginPageKeyword.robot

Library  OperatingSystem


Test Setup        Execute Suite Setup as User
Test Teardown     Execute Suite Teardown

*** Variables ***

${CRM_TestData}     ${TestData}[CRM_TestData]
${SMARTFREN_TESTDATA}     ${TestData}[SMARTFREN_TESTDATA]
${SmartFern_CREDENTIAL}     ${TestData}[USER][SmartFern_user]



*** Test Cases ***
TEST CASE 006
   [Documentation]    Geographical territory
   Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username3]  ${SmartFern_CREDENTIAL}[password3]
   Create Province in Geo territory  TC_001  TD_01
   Logout as a user
   Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username2]  ${SmartFern_CREDENTIAL}[password2]
   Province approve with userID 1015   TC_001  TD_01
   Logout as a user
   Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username5]  ${SmartFern_CREDENTIAL}[password5]
   Province approve with userID 1014   TC_001  TD_01
   Logout as a user
   Sleep  10s



    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username3]  ${SmartFern_CREDENTIAL}[password3]
    Create District in Geo territory  TC_001  TD_01
    Logout as a user
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username2]  ${SmartFern_CREDENTIAL}[password2]
    Province approve with userID 1015   TC_001  TD_01
    Logout as a user
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username5]  ${SmartFern_CREDENTIAL}[password5]
    Province approve with userID 1014   TC_001  TD_01
    Logout as a user
    Sleep  10s

    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username3]  ${SmartFern_CREDENTIAL}[password3]
    Create SubDistrict in Geo territory  TC_001  TD_01
    Logout as a user
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username2]  ${SmartFern_CREDENTIAL}[password2]
    Province approve with userID 1015   TC_001  TD_01
    Logout as a user
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username5]  ${SmartFern_CREDENTIAL}[password5]
    Province approve with userID 1014   TC_001  TD_01
    Logout as a user
    Sleep  10s


    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username3]  ${SmartFern_CREDENTIAL}[password3]
    Create Village in Geo territory  TC_001  TD_01
    Logout as a user
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username2]  ${SmartFern_CREDENTIAL}[password2]
    Province approve with userID 1015   TC_001  TD_01
    Logout as a user
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username5]  ${SmartFern_CREDENTIAL}[password5]
    Province approve with userID 1014   TC_001  TD_01
    Logout as a user
    Sleep  10s





