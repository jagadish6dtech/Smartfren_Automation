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

Library  OperatingSystem


Test Setup        Execute Suite Setup as User
Test Teardown     Execute Suite Teardown

*** Variables ***

${CRM_TestData}     ${TestData}[CRM_TestData]
${SMARTFREN_TESTDATA}     ${TestData}[SMARTFREN_TESTDATA]
${SmartFern_CREDENTIAL}     ${TestData}[USER][SmartFern_user]
#${CRM_UI}  ${wkd}[SSOPage][crm]
#${ProfileDetailsPage}  ${CRMPage}[ProfileDetailPage]
#${AccoutDetailPage}  ${CRMPage}[AccoutDetailPage]
#${ServiceDetailsPage}  ${CRMPage}[ServiceDetailsPage]
#${HomePage}  ${CRMPage}[HomePage]        # Importing Home page Components


*** Test Cases ***
TEST CASE 007
   [Documentation]    Approval My Task

   Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username2]  ${SmartFern_CREDENTIAL}[password2]
   Province approve with userID 1015   TC_001  TD_01
   Logout as a user
   Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username5]  ${SmartFern_CREDENTIAL}[password5]
   Province approve with userID 1014   TC_001  TD_01
   Logout as a user
   Sleep  10s



