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


*** Test Cases ***
TEST CASE 010
    [Documentation]    To Edit / View various Sales Force Mbooklet
    Login to SMARTFERN UI  ${SmartFern_CREDENTIAL}[username1]  ${SmartFern_CREDENTIAL}[password1]



    Add Shedule To Product Sales Force Mbooklet  TC_001  TD_01
    Add Shedule To Program Sales Force Mbooklet  TC_001  TD_02
    Add Shedule To VideoOnDemand Sales Force Mbooklet  TC_001  TD_03
    Add Shedule To TipsAndTricks Sales Force Mbooklet  TC_001  TD_04
    Add Shedule To Q&A Sales Force Mbooklet  TC_001  TD_05


    #Edit Product Sales Force Mbooklet             TC_001  TD_01
    #Edit Program Sales Force Mbooklet             TC_001  TD_02
    #Edit Video on Demand SalesForce Mbooklet      TC_001  TD_03
    #Edit Tips and tricks Sales Force Mbooklet     TC_001  TD_04
    #Edit Q&A Sales Force Mbooklet                 TC_001  TD_05


    Sleep  20s




