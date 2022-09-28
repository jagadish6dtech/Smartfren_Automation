*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary
Library    Collections
Library    String
Variables     ../../Resource/PageObjects/PageObjects.yaml
Variables     ../../Resource/PageObjects/TestData.yaml
Resource      ../../Resource/PageKeywords/Common.robot
Library   ../TestData/ReadDataFromExcel.py


Library     OperatingSystem
Library     SeleniumLibrary
Library    Collections
Library    String
Library    Dialogs
Library    DateTime
Library    XML
Library    ReadDataFromExcel
Library    AppiumLibrary
Variables    ../../Resource/PageObjects/PageObjects.yaml
Variables    ../../Resource/PageObjects/TestData.yaml
Resource     ./Common.robot
Resource    Read_TestData_Keyword.robot


*** Variables ***
${URL}      ${TestData}[URL]
${Broswer}  ${TestData}[Browser]
${Environment}      ${TestData}[Environment]
#${OrderSearch}      ${CRMPage}[OrderSearch]
#${LoginPage}      ${CRMPage}[LoginPage]
${TimeOut}      60s
${Start}        1s

${URL}      ${TestData}[URL]
${Broswer}  ${TestData}[Browser]
${Environment}      ${TestData}[Environment]
#${OrderSearch}      ${CRMPage}[OrderSearch]
${TimeOut}      120s
${Start}        1s
${Orderid}=  960908078870589440
${Current_date}=   


#############################################################

${CRM_TestData}     ${TestData}[CRM_TestData]
${SMARTFREN_TESTDATA}     ${TestData}[SMARTFREN_TESTDATA]
#${WKD_CRM_TESTDATA}     ${TestData}[WKD_CRM_TESTDATA]
${SmartFern_CREDENTIAL}     ${TestData}[USER][SmartFern_user]
${ISIPulsaDetailsPage}    ${wkd}[ISIPulsaDetailsPage]
${BeliPacketDetailsPage}    ${wkd}[BeliPacketDetailsPage]
${Outlet Onborading}       ${wkd}[Outlet Onborading]
${Approval Workflow}       ${wkd}[Approval Workflow]
${Geographical Territory}       ${wkd}[Geographical Territory]
${ApprovalTask}       ${wkd}[ApprovalTask]
${MbookletConfiguration}       ${wkd}[MbookletConfiguration]

*** Keywords ***



Validate Value
    [Arguments]     ${value}  ${locator}
    Wait Until Keyword Succeeds    ${TimeOut}      ${Start}     wait until page contains element    ${locator}



#Go Back to Home Page
    #[Documentation]    To Navigate to Home screen of CRM UI
    #Wait Until Keyword Succeeds    ${TimeOut}      ${Start}      click element   ${HomePage}[HomeButton]

Handle PopUp
    [Arguments]     ${locator}  ${Expectedvalue}
    Verify elements is visible and displayed  ${locator}
    ${String}=  SeleniumLibrary.get text     ${locator}
    Log To Console  ------------------------
    Log To Console  ${String}
    Log To Console  ------------------------
    Should be equal  ${String}   ${Expectedvalue}

Set Slider
    [Arguments]     ${label}  ${value}
    #${String}=  get text     ${locator}
    #Log To Console  ${String}
    ${Is_Checkbox_Selected}=    Run Keyword And Return Status    Checkbox Should Be Selected    //label[text()='${label}']/following-sibling::div/label//span/input[@type='checkbox']
    #Run Keyword If  '${Is_Checkbox_Selected}' != 'False'  Log To Console  NANACONDITION

    #Click Item  ${locator}

    ${passed}=    Run Keyword If  '${Is_Checkbox_Selected}' == 'False'  Set Variable    NO
    ...  ELSE IF  '${Is_Checkbox_Selected}' == 'True'  Set Variable    YES
    ...  ELSE  Log To Console  SLIDER STATUS SHOULD BE BINARY[True/False]

    Log To Console  bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
    Log To Console  ${passed}
    Log To Console  bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb

    Run Keyword If  '${value}' != '${passed}'  Click Item  //label[text()='${label}']/following-sibling::div/label//div
    ...  ELSE IF  '${value}' == 'nan'  Log To Console  Blank
    ...  ELSE  Log To Console  SLIDER STATUS SHOULD BE BINARY[YES/NO]


File Uplaod
    [Arguments]     ${locator}  ${FilePath}
    Scroll Element Into View    ${locator}
    Sleep  4s
    Choose File    ${locator}  ${FilePath}





Logout as a user
    Click Item   ${Geographical Territory}[UserInfoButton]
    Sleep  2s
    Click Item   //div[contains(text(),'Sign Out')]
    Sleep  4s


Set Month
   [Arguments]   ${Locator}    ${Month}
   Click Item    ${Locator}
   Set Dropdown5       //select[@class='react-datepicker__month-select']      ${Month}

Set Year
  [Arguments]    ${Locator}  ${Year}
  Click Item    ${Locator}
  Click Item  //option[text()='${Year}']

Set Date
  [Arguments]   ${Locator}   ${Date}
  Click Item    ${Locator}
  Click Item   //div[@aria-label='${Date}']

Start Time
  [Arguments]    ${Locator}   ${StartTime}
  Click Item        ${Locator}
  Click Item    //li[normalize-space()='${StartTime}']

End Time
  [Arguments]    ${Locator}   ${EndTime}
  Click Item     ${Locator}
  Click Item    //li[normalize-space()='${EndTime}']





###############################################################################################################\


ISI_Pulsa
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  SMARTFREN_ISI_PULSA   ${caseID}  ${dataID}
    ${MDN_NUMBER}=  getData  ${data}  MDN_Number
    ${RP_VALUE}=  getData  ${data}  RP_Value
    ${PAYMENT_TYPE}=  getData  ${data}  Payment_Type
    ${PIN_NUMBER_DIGIT1}=  getData  ${data}  PIN_NUMBER_Digit1
    ${PIN_NUMBER_DIGIT2}=  getData  ${data}  PIN_NUMBER_Digit2
    ${PIN_NUMBER_DIGIT3}=  getData  ${data}  PIN_NUMBER_Digit3
    ${PIN_NUMBER_DIGIT4}=  getData  ${data}  PIN_NUMBER_Digit4
    ${PIN_NUMBER_DIGIT5}=  getData  ${data}  PIN_NUMBER_Digit5
    ${PIN_NUMBER_DIGIT6}=  getData  ${data}  PIN_NUMBER_Digit6


    Click Item     ${ISIPulsaDetailsPage}[Apps]
    Sleep  3s
    Click Item     ${ISIPulsaDetailsPage}[POSApp]
    Sleep  2s
    Click Item     ${ISIPulsaDetailsPage}[ISIPulsa]
    Sleep  2s
    Set Input      ${ISIPulsaDetailsPage}[InputMDN]  ${MDN_NUMBER}
    Sleep  4s
    Click Item     ${ISIPulsaDetailsPage}[InputMDNProceedButton]
    Sleep  4s
    Set Input      ${ISIPulsaDetailsPage}[InputRPValue]  ${RP_VALUE}
    Sleep  3s
    Click Item     ${ISIPulsaDetailsPage}[RPValueAddButton]
    Sleep  10s
    Set Dropdown3  ${ISIPulsaDetailsPage}[PaymentTypeDropdown]  ${PAYMENT_TYPE}
    Sleep  10s
    Click Item     ${ISIPulsaDetailsPage}[FinalProccedButton]
    Set Input      ${ISIPulsaDetailsPage}[PINDigit1]   ${PIN_NUMBER_DIGIT1}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit2]   ${PIN_NUMBER_DIGIT2}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit3]   ${PIN_NUMBER_DIGIT3}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit4]   ${PIN_NUMBER_DIGIT4}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit5]   ${PIN_NUMBER_DIGIT5}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit6]   ${PIN_NUMBER_DIGIT6}
    Click Item     ${ISIPulsaDetailsPage}[ConfirmButton]
    Sleep  3s
    Verify elements is visible and displayed    ${ISIPulsaDetailsPage}[TranscationSuccessfulltext]
    ${TranscationStatus}=  get text    ${ISIPulsaDetailsPage}[TranscationSuccessfulltext]
    log to console   ${TranscationStatus}
    Verify elements is visible and displayed    ${ISIPulsaDetailsPage}[TranscationId]
    ${Transcationid}=  get text    ${ISIPulsaDetailsPage}[TranscationId]
    log to console   ${Transcationid}
    Click Item     ${ISIPulsaDetailsPage}[TranscationOk]
    Sleep  5s


Beli Paket
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel ${SMARTFREN_TESTDATA}  SMARTFREN_BELI_PAKET   ${caseID}  ${dataID}
    ${MDN_NUMBER}=  getData  ${data}  MDN_Number
    ${PACKAGE}=  getData  ${data}  Package
    ${RP_VALUE}=  getData  ${data}  RP_Value
    ${PAYMENT_TYPE}=  getData  ${data}  Payment_Type
    ${PIN_NUMBER_DIGIT1}=  getData  ${data}  PIN_NUMBER_Digit1
    ${PIN_NUMBER_DIGIT2}=  getData  ${data}  PIN_NUMBER_Digit2
    ${PIN_NUMBER_DIGIT3}=  getData  ${data}  PIN_NUMBER_Digit3
    ${PIN_NUMBER_DIGIT4}=  getData  ${data}  PIN_NUMBER_Digit4
    ${PIN_NUMBER_DIGIT5}=  getData  ${data}  PIN_NUMBER_Digit5
    ${PIN_NUMBER_DIGIT6}=  getData  ${data}  PIN_NUMBER_Digit6


    #Click Item     ${BeliPacketDetailsPage}[Apps]
    #Sleep  3s
    #Click Item     ${BeliPacketDetailsPage}[POSApp]
    #Sleep  5s
    Click Item     ${BeliPacketDetailsPage}[BeliPaket]
    Sleep  2s
    Set Input      ${BeliPacketDetailsPage}[InputMDN]  ${MDN_NUMBER}
    Sleep  2s
    Click Item     ${BeliPacketDetailsPage}[InputMDNProceedButton]
    Sleep  5s
    Set Input      ${BeliPacketDetailsPage}[SearchPackage]    ${PACKAGE}
    Sleep  5s
    Click Item     (//div[contains(text(),'${RP_Value}')])[1]
    Sleep  4s
    Set Dropdown3  ${BeliPacketDetailsPage}[PaymentTypeDropdown]  ${PAYMENT_TYPE}
    Sleep  3s
    Click Item     ${BeliPacketDetailsPage}[FinalProccedButton]
    Set Input      ${ISIPulsaDetailsPage}[PINDigit1]   ${PIN_NUMBER_DIGIT1}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit2]   ${PIN_NUMBER_DIGIT2}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit3]   ${PIN_NUMBER_DIGIT3}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit4]   ${PIN_NUMBER_DIGIT4}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit5]   ${PIN_NUMBER_DIGIT5}
    Set Input      ${ISIPulsaDetailsPage}[PINDigit6]   ${PIN_NUMBER_DIGIT6}
    Click Item    ${ISIPulsaDetailsPage}[ConfirmButton]
    Sleep  3s
    Verify elements is visible and displayed    ${ISIPulsaDetailsPage}[TranscationSuccessfulltext]
    ${TranscationStatus}=  get text    ${ISIPulsaDetailsPage}[TranscationSuccessfulltext]
    log to console   ${TranscationStatus}
    Verify elements is visible and displayed    ${ISIPulsaDetailsPage}[TranscationId]
    ${Transcationid}=  get text    ${ISIPulsaDetailsPage}[TranscationId]
    log to console   ${Transcationid}
    Click Item     ${ISIPulsaDetailsPage}[TranscationOk]
    Sleep  5s

Outlet Onboarding
     [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Outlet_Onboarding   ${caseID}  ${dataID}
    ${OutletAddress}=  getData  ${data}  OutletAddress
    ${OutletName}=     getData  ${data}  Outlet_Name
    ${Product_Type}=   getData  ${data}  Product_Type
    ${ProductFocus1}=  getData  ${data}   ProductFocus1
    ${ProductFocus2}=  getData  ${data}   ProductFocus2
    ${ProductFocus3}=  getData  ${data}   ProductFocus3
    ${ProductFocus4}=  getData  ${data}   ProductFocus4
    ${FilePath}=  getData  ${data}   FilePath


    
    Click Item      ${Outlet Onborading}[Channel Partner]
    Click Item      ${Outlet Onborading}[OutletManagement]
    Click Item      ${Outlet Onborading}[CreateOutlet]
    #Set Dropdown3   ${Outlet Onborading}[ProductType]    ${Product_Type}
    #Set Dropdown3   ${Outlet Onborading}[ProductFocus1]  ${ProductFocus1}
    #Set Dropdown3   ${Outlet Onborading}[ProductFocus2]  ${ProductFocus2}
    #Set Dropdown3   ${Outlet Onborading}[ProductFocus2]  ${ProductFocus3}
    #Set Dropdown3   ${Outlet Onborading}[ProductFocus3]  ${ProductFocus4}

    Sleep  2s
    File Uplaod   ${Outlet Onborading}[FileUpload]   ${FilePath}
    Click Item    //div[text()=' Next']
    Sleep  15s


Approval workflow
    [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  ApprovalWorkFlow   ${caseID}  ${dataID}
    ${Event}=  getData  ${data}  Event
    ${Duration}=     getData  ${data}  Duration
    ${ApprovalHeirachy}=   getData  ${data}  ApprovalHeirachy
    ${Intiator}=  getData  ${data}  Intiator
    ${Level}=     getData  ${data}  Level
    ${Channel}=   getData  ${data}  Channel
    ${Desgination}=  getData  ${data}  Desgination
    ${DesignationType}=     getData  ${data}  DesignationType
    ${ApproverType}=     getData  ${data}  ApproverType


   Click Item      ${Approval Workflow}[Approvals]
   Click Item      ${Approval Workflow}[AppovalWorkFlow]
   Click Item      ${Approval Workflow}[CreateApprovalWorkFlow]
   Set Dropdown3   ${Approval Workflow}[EventDropdown]  ${Event}
   Set Dropdown3   ${Approval Workflow}[DurationDropdown]  ${Duration}
   Click Item      ${Approval Workflow}[ApprovalHeirachy]
   Click Item      ${Approval Workflow}[IntiatorNo]
   Click Item      ${Approval Workflow}[AddLevel]
   Click Item      ${Approval Workflow}[AddApprover]
   Set Dropdown3   ${Approval Workflow}[AppoverListDropdown]  ${ApproverType}
   Click Item      ${Approval Workflow}[ApprovalListNextButton]
   Click Item      ${Approval Workflow}[OperatorLevel]
   Set Dropdown3   ${Approval Workflow}[DesignationDropdown]  ${Desgination}
   Click Item      ${Approval Workflow}[DesignationTypeReportingDesignation]
   Click Item      ${Approval Workflow}[DesignationAddButton]
   Sleep   3s
   Click Item      ${Approval Workflow}[CreateButton]
   Sleep  5s

Create Province in Geo territory
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  GeographicalTerritory  ${caseID}  ${dataID}
    ${Province}=  getData  ${data}  Province
    ${District}=     getData  ${data}  District
    ${SubDistrict}=     getData  ${data}  SubDistrict
    ${Village}=     getData  ${data}  Village


   Click Item      ${Geographical Territory}[SalesStructure]
   Click Item      ${Geographical Territory}[Geographicalterritory]
   Click Item      ${Geographical Territory}[PlusIcon]
   Set Input       ${Geographical Territory}[Province]  ${Province}
   Click Item      ${Geographical Territory}[SaveButton]
   Sleep  2s
   Click Item       //button[@aria-label='close']

Province approve with userID 1014
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  ApprovalTask   ${caseID}  ${dataID}
    ${approvalComments}=  getData  ${data}  approvalComments
    ${ApprovalPOPUPMessage}=     getData  ${data}  ApprovalPOPUPMessage
    ${ProvinceName}=     getData  ${data}  ProvinceName

   #Click Item       //img[@class='menu-icon iconshown']
   Click Item      ${ApprovalTask}[Approvals]
   Sleep  5s
   Click Item      ${ApprovalTask}[MyTasks]
   Sleep  5s
   Click Item      (//img)[6]
   Sleep  2s
   ${value} =  Get Element Attribute   //input[@id='nodeName__id']    value
   Should Be Equal As Strings    ${value}    ${ProvinceName}
   Click Item      ${ApprovalTask}[ApproveButton]
   Set Input     ${ApprovalTask}[ApprovalTextarea]   ${approvalComments}
   Click Item      ${ApprovalTask}[ApprovalConfirmButton]
   Sleep  4s
   Click Item       //button[@aria-label='close']
   #Handle PopUp   ${ApprovalTask}[ApprovalPOPUPMessage]   ${ApprovalPOPUPMessage}

Province approve with userID 1015
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  ApprovalTask   ${caseID}  ${dataID}
    ${approvalComments}=  getData  ${data}  approvalComments
    ${ApprovalPOPUPMessage}=     getData  ${data}  ApprovalPOPUPMessage
    ${ProvinceName}=     getData  ${data}  ProvinceName

   #Click Item      ${ApprovalTask}[MenuBar]
   Click Item      ${ApprovalTask}[Approvals]
   Sleep  5s
   Click Item      ${ApprovalTask}[MyTasks]
   Sleep  5s
   Click Item      (//img)[8]
   Sleep  2s
   ${value} =  Get Element Attribute   //input[@id='nodeName__id']    value
   Should Be Equal As Strings    ${value}    ${ProvinceName}
   Sleep  2s
   Click Item      ${ApprovalTask}[ApproveButton]
   Set Input     ${ApprovalTask}[ApprovalTextarea]   ${approvalComments}
   Click Item      ${ApprovalTask}[ApprovalConfirmButton]
   Sleep  4s
   Click Item       //button[@aria-label='close']
   #Handle PopUp   ${ApprovalTask}[ApprovalPOPUPMessage]   ${ApprovalPOPUPMessage}

Create District in Geo territory
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  GeographicalTerritory  ${caseID}  ${dataID}
    ${Province}=  getData  ${data}  Province
    ${District}=     getData  ${data}  District
    ${SubDistrict}=     getData  ${data}  SubDistrict
    ${Village}=     getData  ${data}  Village


   Click Item      ${Geographical Territory}[SalesStructure]
   Click Item      ${Geographical Territory}[Geographicalterritory]
   Click Item      //span[contains(@class,'more-icon')]//i[contains(@class,'fa fa-search')]
   Set Input       //input[contains(@class,'list-input-search')]     ${Province}
   Click Item      //i[@class='fa fa-ellipsis-h']
   Click Item      //button[normalize-space()='Create']
   Set Input       ${Geographical Territory}[Province]  ${District}
   Click Item      ${Geographical Territory}[SaveButton]
   Sleep  2s
   Click Item       //button[@aria-label='close']

Create SubDistrict in Geo territory
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  GeographicalTerritory  ${caseID}  ${dataID}
    ${Province}=  getData  ${data}  Province
    ${District}=     getData  ${data}  District
    ${SubDistrict}=     getData  ${data}  SubDistrict
    ${SubDistrictType}=     getData  ${data}   SubDistrictType
    ${Village}=     getData  ${data}  Village


   Click Item      ${Geographical Territory}[SalesStructure]
   Click Item      ${Geographical Territory}[Geographicalterritory]
   Click Item      //span[contains(@class,'more-icon')]//i[contains(@class,'fa fa-search')]
   Set Input       //input[contains(@class,'list-input-search')]     ${Province}
   Click Item       //div[text()='${Province}']
   Sleep  2s
   Click Item      //span[contains(@class,'more-icon')]//i[contains(@class,'fa fa-search')]
   Set Input       (//input[contains(@class,'list-input-search')])[2]     ${District}
   Click Item       //div[text()='${District}']
   Click Item      (//i[@class='fa fa-ellipsis-h'])[2]
   Click Item      (//button[text()='Create'])[2]
   Set Input       ${Geographical Territory}[Province]  ${SubDistrict}
   Set Dropdown3    //div[@class='css-1hwfws3 Select__value-container']   ${SubDistrictType}
   Click Item      ${Geographical Territory}[SaveButton]
   Sleep  2s
   Click Item       //button[@aria-label='close']

Create Village in Geo territory
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  GeographicalTerritory  ${caseID}  ${dataID}
    ${Province}=  getData  ${data}  Province
    ${District}=     getData  ${data}  District
    ${SubDistrict}=     getData  ${data}  SubDistrict
    ${SubDistrictType}=     getData  ${data}   SubDistrictType
    ${Village}=     getData  ${data}  Village


   Click Item      ${Geographical Territory}[SalesStructure]
   Click Item      ${Geographical Territory}[Geographicalterritory]
   Click Item      //span[contains(@class,'more-icon')]//i[contains(@class,'fa fa-search')]
   Set Input       //input[contains(@class,'list-input-search')]     ${Province}
   Click Item       //div[text()='${Province}']
   Sleep  2s
   Click Item      //span[contains(@class,'more-icon')]//i[contains(@class,'fa fa-search')]
   Set Input       (//input[contains(@class,'list-input-search')])[2]     ${District}
   Click Item       //div[text()='${District}']
   Sleep  2s
   Click Item      //span[contains(@class,'more-icon')]//i[contains(@class,'fa fa-search')]
   Set Input       (//input[contains(@class,'list-input-search')])[3]    ${SubDistrict}
   #Click Item       //div[text()=' ${SubDistrict}']
   Sleep  2s
   Click Item      (//i[@class='fa fa-ellipsis-h'])[3]
   Click Item      (//button[text()='Create'])[3]
   Set Input       ${Geographical Territory}[Province]  ${Village}
   Click Item      ${Geographical Territory}[SaveButton]
   Sleep  2s
   Click Item       //button[@aria-label='close']

Approval My Task
   [Arguments]     ${caseID}  ${dataID}

    ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  ApprovalTask   ${caseID}  ${dataID}
    ${approvalComments}=  getData  ${data}  approvalComments
    ${ApprovalPOPUPMessage}=     getData  ${data}  ApprovalPOPUPMessage
    ${ProvinceNameVaue}=     getData  ${data}  ProvinceName


   #Click Item      ${ApprovalTask}[MenuBar]
   Click Item      ${ApprovalTask}[Approvals]
   Click Item      ${ApprovalTask}[MyTasks]
   Click Item      ${ApprovalTask}[ViewButton2]
   Sleep  5s
   ${ProvinceName}=  Get Element Attribute    //input[@id='nodeName__id']   value
   Log   ${ProvinceName}
   Should Be Equal As Strings    ${ProvinceName}  ${ProvinceNameVaue}
   Sleep  4s
   Click Item      ${ApprovalTask}[ApproveButton]
   Set Input     ${ApprovalTask}[ApprovalTextarea]   ${approvalComments}
   Click Item      ${ApprovalTask}[ApprovalConfirmButton]
   Sleep  4s
   #Handle PopUp   ${ApprovalTask}[ApprovalPOPUPMessage]   ${ApprovalPOPUPMessage}

Create Various Mbooklet Types as Product
   [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name


   Click Item     ${BeliPacketDetailsPage}[Apps]
   Sleep  2s
   Click Item     //span[normalize-space()='KMS']
   Sleep  5s
   Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
   Sleep  5s
   Click Item      //a[text()='M-booklet Type']
   Click Item      ${MbookletConfiguration}[CreateMbookletTypeButton]
   Set Dropdown3    ${MbookletConfiguration}[MbookletTemplateDropdown]  ${M-Booklet_Template}
   input value on text fields    ${MbookletConfiguration}[MbookletTypeName]   ${Type_Name}
   Click Item    ${MbookletConfiguration}[MbookletTypeName]
   Sleep  5s
   Click Item      ${MbookletConfiguration}[AddMbookletButton]
   Handle PopUp    ${MbookletConfiguration}[PopUpmessageCreateMbooklet]   Successfully added mbooklet type
   Sleep  5s
   #Click Item    //li[@class='side-menu-list'][2]
   Sleep  5s
   #Click Item         (//button[contains(text(),'Add')])[1]
   #Set Input      //input[@name='start_date']   08-10-2022
   #Click Item   //input[@name='start_date']
   #Set Month     ${Month}
   #Set Year      ${Year}
   #Set Date      ${Date}
   #Click Item   //label[normalize-space()='View']
   #Sleep  5s

Create Various Mbooklet Types as Programs
    [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name


   Click Item      ${MbookletConfiguration}[CreateMbookletTypeButton]
   Set Dropdown3    ${MbookletConfiguration}[MbookletTemplateDropdown]  ${M-Booklet_Template}
   Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Type_Name}
   Click Item    ${MbookletConfiguration}[MbookletTypeName]
   Sleep  5s
   Click Item      ${MbookletConfiguration}[AddMbookletButton]
   Handle PopUp    ${MbookletConfiguration}[PopUpmessageCreateMbooklet]   Successfully added mbooklet type
   Sleep  5s

 Create Various Mbooklet Types as Video on Demand
   [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name


   Click Item      ${MbookletConfiguration}[CreateMbookletTypeButton]
   Set Dropdown3    ${MbookletConfiguration}[MbookletTemplateDropdown]  ${M-Booklet_Template}
   Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Type_Name}
   Click Item    ${MbookletConfiguration}[MbookletTypeName]
   Sleep  5s
   Click Item      ${MbookletConfiguration}[AddMbookletButton]
   Handle PopUp    ${MbookletConfiguration}[PopUpmessageCreateMbooklet]   Successfully added mbooklet type
   Sleep  5s

Create Various Mbooklet Types as Tips & Tricks
   [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name


   Click Item      ${MbookletConfiguration}[CreateMbookletTypeButton]
   Set Dropdown3    ${MbookletConfiguration}[MbookletTemplateDropdown]  ${M-Booklet_Template}
   Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Type_Name}
   Click Item    ${MbookletConfiguration}[MbookletTypeName]
   Sleep  5s
   Click Item      ${MbookletConfiguration}[AddMbookletButton]
   Handle PopUp    ${MbookletConfiguration}[PopUpmessageCreateMbooklet]   Successfully added mbooklet type
   Sleep  5s

Create Various Mbooklet Types as Q&A
   [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name


   Click Item      ${MbookletConfiguration}[CreateMbookletTypeButton]
   Set Dropdown3    ${MbookletConfiguration}[MbookletTemplateDropdown]  ${M-Booklet_Template}
   Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Type_Name}
   Click Item    ${MbookletConfiguration}[MbookletTypeName]
   Sleep  5s
   Click Item     ${MbookletConfiguration}[AddMbookletButton]
   Handle PopUp    ${MbookletConfiguration}[PopUpmessageCreateMbooklet]   Successfully added mbooklet type
   Sleep  15s

Edit Various Mbooklet Types as Product
   [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name
   ${Rename_Type_name}=  getData  ${data}  Rename_Type_name
   ${Rename_MBooklet_Template}=  getData  ${data}  Rename_MBooklet_Template

  Click Item      ${MbookletConfiguration}[SearchButton]
  Set Input    ${MbookletConfiguration}[MbookletTypeSearchButton]    ${Type_Name}
  Sleep  2s
  Click Item      ${MbookletConfiguration}[MbookletTypeEditButton]
  Clear Element Text      ${MbookletConfiguration}[MbookletTypeName]
  Sleep  2s
  Set Dropdown3    //input[@class='select-form__input']    ${Rename_MBooklet_Template}

  Sleep  2s
  Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Rename_Type_name}
  Click Item    ${MbookletConfiguration}[MbookletTypeName]
  Sleep  5s
  Click Item      ${MbookletConfiguration}[UpdateMbooklettype]
  Handle PopUp    ${MbookletConfiguration}[PopUpmessageUpdateMbooklet]   Successfully updated mbooklet type
  Sleep  5s

Edit Various Mbooklet Types as Programs
  [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name
   ${Rename_Type_name}=  getData  ${data}  Rename_Type_name
   ${Rename_MBooklet_Template}=  getData  ${data}  Rename_MBooklet_Template

  Click Item      ${MbookletConfiguration}[SearchButton]
  Set Input    ${MbookletConfiguration}[MbookletTypeSearchButton]    ${Type_Name}
  Sleep  2s
  Click Item      ${MbookletConfiguration}[MbookletTypeEditButton]
  Clear Element Text      ${MbookletConfiguration}[MbookletTypeName]
  Sleep  2s
  Set Dropdown3    //input[@class='select-form__input']    ${Rename_MBooklet_Template}
  Sleep  2s
  Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Rename_Type_name}
  Click Item    ${MbookletConfiguration}[MbookletTypeName]
  Sleep  5s
  Click Item      ${MbookletConfiguration}[UpdateMbooklettype]
  Handle PopUp    ${MbookletConfiguration}[PopUpmessageUpdateMbooklet]   Successfully updated mbooklet type
  Sleep  5s

Edit Various Mbooklet Types as Video on Demand
  [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name
   ${Rename_Type_name}=  getData  ${data}  Rename_Type_name
   ${Rename_MBooklet_Template}=  getData  ${data}  Rename_MBooklet_Template

  Click Item      ${MbookletConfiguration}[SearchButton]
  Set Input    ${MbookletConfiguration}[MbookletTypeSearchButton]    ${Type_Name}
  Sleep  2s
  Click Item      ${MbookletConfiguration}[MbookletTypeEditButton]
  Clear Element Text      ${MbookletConfiguration}[MbookletTypeName]
  Sleep  2s
  Set Dropdown3    //input[@class='select-form__input']    ${Rename_MBooklet_Template}
  Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Rename_Type_name}
  Click Item    ${MbookletConfiguration}[MbookletTypeName]
  Sleep  5s
  Click Item      ${MbookletConfiguration}[UpdateMbooklettype]
  Handle PopUp    ${MbookletConfiguration}[PopUpmessageUpdateMbooklet]   Successfully updated mbooklet type
  Sleep  5s

Edit Various Mbooklet Types as Tips & Tricks
   [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name
   ${Rename_Type_name}=  getData  ${data}  Rename_Type_name
    ${Rename_MBooklet_Template}=  getData  ${data}   Rename_MBooklet_Template


  Click Item      ${MbookletConfiguration}[SearchButton]
  Set Input    ${MbookletConfiguration}[MbookletTypeSearchButton]    ${Type_Name}
  Sleep  2s
  Click Item      ${MbookletConfiguration}[MbookletTypeEditButton]
  Clear Element Text      ${MbookletConfiguration}[MbookletTypeName]
  Sleep  2s
  Set Dropdown3    //input[@class='select-form__input']    ${Rename_MBooklet_Template}
  Sleep  2s
  Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Rename_Type_name}
  Click Item    ${MbookletConfiguration}[MbookletTypeName]
  Sleep  5s
  Click Item      ${MbookletConfiguration}[UpdateMbooklettype]
  Handle PopUp    ${MbookletConfiguration}[PopUpmessageUpdateMbooklet]   Successfully updated mbooklet type
  Sleep  5s

Edit Various Mbooklet Types as Q&A
    [Arguments]     ${caseID}  ${dataID}

   ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  MbookletConfiguration   ${caseID}  ${dataID}
   ${M-Booklet_Template}=  getData  ${data}  M-Booklet_Template
   ${Type_Name}=  getData  ${data}  Type_Name
   ${Rename_Type_name}=  getData  ${data}  Rename_Type_name
   ${Rename_MBooklet_Template}=  getData  ${data}  Rename_MBooklet_Template

  Click Item      ${MbookletConfiguration}[SearchButton]
  Set Input    ${MbookletConfiguration}[MbookletTypeSearchButton]    ${Type_Name}
  Sleep  2s
  Click Item      ${MbookletConfiguration}[MbookletTypeEditButton]
  Clear Element Text      ${MbookletConfiguration}[MbookletTypeName]
  Sleep  2s
  Set Dropdown3    //input[@class='select-form__input']    ${Rename_MBooklet_Template}
  Sleep  2s
  Set Input       ${MbookletConfiguration}[MbookletTypeName]   ${Rename_Type_name}
  Click Item    ${MbookletConfiguration}[MbookletTypeName]
  Sleep  5s
  Click Item      ${MbookletConfiguration}[UpdateMbooklettype]
  Handle PopUp    ${MbookletConfiguration}[PopUpmessageUpdateMbooklet]   Successfully updated mbooklet type
  Sleep  5s



Edit Product Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}


  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  SalesForceMbooklet   ${caseID}  ${dataID}
  #${M-Booklet_Type}=  getData  ${data}  M-Booklet_Type
  #${Material_Name}=  getData  ${data}  Material_Name
  #${Flyer}=  getData  ${data}  Flyer
  #${FilterType}=  getData  ${data}  FilterType
  #${FilePath}=  getData  ${data}  FilePath
  #${ShortDescription}=  getData  ${data}  ShortDescription
  #${StartDate}=  getData  ${data}  StartDate
  #${EndDate}=  getData  ${data}  EndDate
  #${Participants}=  getData  ${data}  Participants
  #${Add Tags}=  getData  ${data}  Add Tags
  #${Rename_Material_Name}=  getData  ${data}   Rename_Material_Name



    ${M-Booklet_Type}=  Get Value1   ${data}  M-Booklet_Type
    ${Material_Name}=  Get Value1   ${data}  Material_Name
    ${Flyer}=  Get Value1   ${data}  Flyer
    ${FilterType}=  Get Value1   ${data}  FilterType
    ${FilePath}=  Get Value1   ${data}  FilePath
    ${ShortDescription}=  Get Value1   ${data}  ShortDescription
    ${StartDate}=  Get Value1   ${data}  StartDate
    ${EndDate}=  Get Value1   ${data}  EndDate
    ${Participants}=  Get Value1   ${data}  Participants
    ${Add Tags}=  Get Value1   ${data}  Add Tags
    ${Rename_Material_Name}=  Get Value1   ${data}   Rename_Material_Name



    Click Item     ${BeliPacketDetailsPage}[Apps]
    Sleep  2s
    Click Item     //span[normalize-space()='KMS']
    Sleep  5s
    Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
    Sleep  3s
    Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
    Sleep   2s
    Click Item   (//i[@class='fa fa-search'])[2]
    Sleep  3s
    Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Material_Name}
    Sleep  2s
    Click Item   //img[contains(@src,'/sfdms/images/kms-edit.svg')]
    Sleep  5s
  Set Input  //input[@id='filed_mbookletName']  ${Rename_Material_Name}
  #Click Item    //span[normalize-space()='YES'][1]
  File Uplaod   //input[@id='filed_flyerImages']    ${FilePath}
  Sleep  2s
  Click Item    //div[@id='selectfield_tags']//div[@class='select-form__indicator select-form__clear-indicator css-tlfecz-indicatorContainer']
  Sleep  4s
  Set Dropdown3   (//input[@class='select-form__input'])[3]     ${Add Tags}
  Sleep  2s
  Set Dropdown3   (//input[@class='select-form__input'])[4]    ${FilterType}
  Sleep  2s
  Set Input   //textarea[@id='filed_shortDescription']     ${ShortDescription}
  Execute Javascript    var xpath = document.evaluate("//div[@class='drop-zone']/input", document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.style.setProperty('display', 'block');
  Sleep  05s
  File Uplaod    //div[@class="drop-zone"]//input    ${FilePath}
  Click Item   //div[normalize-space()='Update']
  Sleep  5s

Add Shedule To Product Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Shedule_SaleForceMbooklet   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath



  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Date    //input[@name='start_date']   ${StartDate}
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='View']
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]



Edit Program Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  SalesForceMbooklet   ${caseID}  ${dataID}
  ${M-Booklet_Type}=  getData  ${data}  M-Booklet_Type
  ${Material_Name}=  getData  ${data}  Material_Name
  ${Flyer}=  getData  ${data}  Flyer
  ${FilterType}=  getData  ${data}  FilterType
  ${FilePath}=  getData  ${data}  FilePath
  ${ShortDescription}=  getData  ${data}  ShortDescription
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${Participants}=  getData  ${data}  Participants
  ${Rename_ Material_Name}=  getData  ${data}  Rename_Material_Name
  ${Program}=  getData  ${data}  Program
  ${Add Tags}=  getData  ${data}  Add Tags


  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Sleep   2s
  Click Item   (//i[@class='fa fa-search'])[2]
  Sleep  5s
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Material_Name}
  Sleep  2s
  Click Item   //img[contains(@src,'/sfdms/images/kms-edit.svg')]
  Sleep  5s
  Set Input  //input[@id='filed_mbookletName']  ${Rename_Material_Name}
  Sleep  4s
  Set Dropdown3    (//input[@class='select-form__input'])[2]           ${Program}
  Sleep  5s
  Click Item     //div[@id='selectfield_programTags']//div[@class='select-form__indicator select-form__clear-indicator css-tlfecz-indicatorContainer']
  Sleep  2s
  Set Dropdown3   (//input[@class='select-form__input'])[3]     ${Add Tags}
  Sleep  2s
  Set Dropdown3   (//input[@class='select-form__input'])[4]    ${FilterType}
  Sleep  2s
  File Uplaod    //input[@id='filed_programImages']    ${FilePath}
  Sleep  2s
  Execute Javascript    var xpath = document.evaluate("//div[@class='drop-zone']/input", document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.style.setProperty('display', 'block');
  Sleep  05s
  File Uplaod    //div[@class="drop-zone"]//input    ${FilePath}
  Click Item   //div[normalize-space()='Update']
  Sleep  5s



 Edit Video on Demand SalesForce Mbooklet
   [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  SalesForceMbooklet   ${caseID}  ${dataID}
  ${M-Booklet_Type}=  getData  ${data}  M-Booklet_Type
  ${Material_Name}=  getData  ${data}  Material_Name
  ${Flyer}=  getData  ${data}  Flyer
  ${FilterType}=  getData  ${data}  FilterType
  ${FilePath}=  getData  ${data}  FilePath
  ${ShortDescription}=  getData  ${data}  ShortDescription
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${Add Tags}=  getData  ${data}   Add Tags
  ${VideoFilePath}=  getData  ${data}   VideoFilePath


  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Sleep   2s
  Click Item   (//i[@class='fa fa-search'])[2]
  Sleep  5s
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']   ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[contains(@src,'/sfdms/images/kms-edit.svg')]
  Sleep  5s
   Set Input    //input[@id='filed_mbookletName']    ${Rename_Material_Name}
  Sleep  4s
  File Uplaod    //input[@id='filed_videoOnDemandVideoFile']     ${VideoFilePath}
  Sleep  4s
  Click Item     //div[@id='selectfield_videoTags']//div[@class='select-form__indicator select-form__clear-indicator css-tlfecz-indicatorContainer']
  Set Dropdown4   (//input[@class='select-form__input'])[2]    ${Add Tags}
  Sleep  2s
  Set Dropdown3  (//input[@class='select-form__input'])[3]        ${FilterType}
  Sleep  4s
  #Click Item         //input[@name='effectiveDate']
  #Set Date        ${EffectiveDate}
  Execute Javascript    var xpath = document.evaluate("//div[@class='drop-zone']/input", document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.style.setProperty('display', 'block');
  Sleep  05s
  File Uplaod    //div[@class="drop-zone"]//input      ${FilePath}
  Sleep  4s
  Click Item   //div[normalize-space()='Update']
  Sleep  5s



Edit Tips and tricks Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  SalesForceMbooklet   ${caseID}  ${dataID}
  ${M-Booklet_Type}=  getData  ${data}  M-Booklet_Type
  ${Material_Name}=  getData  ${data}   Material_Name
  ${FilePath}=  getData  ${data}  FilePath
  ${ShortDescription}=  getData  ${data}  ShortDescription
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${Add Tags}=  getData  ${data}  Add Tags
  ${FilterType}=  getData  ${data}  FilterType
  ${EffectiveDate}=  getData  ${data}  EffectiveDate



  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Sleep   2s
  Click Item   (//i[@class='fa fa-search'])[2]
  Sleep  5s
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Material_Name}
  Sleep  2s
  Click Item   //img[contains(@src,'/sfdms/images/kms-edit.svg')]
  Sleep  5s
  Set Input    //input[@id='filed_mbookletName']      ${Rename_Material_Name}
  Sleep  4s
  Set Input     //input[@id='filed_tipsAndTricksTitle']     ${Rename_Material_Name}
  Sleep  4s
  Click Item     //div[@id='selectfield_tipsAndTricksTag']//div[@class='select-form__indicator select-form__clear-indicator css-tlfecz-indicatorContainer']
  Sleep  2s
  Set Dropdown4   (//input[@class='select-form__input'])[2]    ${Add Tags}
  Set Dropdown3  (//input[@class='select-form__input'])[3]        ${FilterType}
  Sleep  4s
  #Click Item         //input[@name='effectiveDate']
  #Set Date        ${EffectiveDate}
  Execute Javascript    var xpath = document.evaluate("//div[@class='drop-zone']/input", document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.style.setProperty('display', 'block');
  Sleep  10s
  File Uplaod    //div[@class="drop-zone"]//input      ${FilePath}
  Click Item   //div[normalize-space()='Update']
  Sleep  5s


Edit Q&A Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  SalesForceMbooklet   ${caseID}  ${dataID}
  ${M-Booklet_Type}=  getData  ${data}  M-Booklet_Type
  ${Material_Name}=  getData  ${data}  Material_Name
  ${FilePath}=  getData  ${data}  FilePath
  ${ShortDescription}=  getData  ${data}  ShortDescription
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${Add Tags}=  getData  ${data}  Add Tags
  ${FilterType}=  getData  ${data}  FilterType
  ${EffectiveDate}=  getData  ${data}  EffectiveDate
  ${Question}=  getData  ${data}  Question
  ${Answer}=  getData  ${data}   Answer



  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Sleep   2s
  Click Item   (//i[@class='fa fa-search'])[2]
  Sleep  5s
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Material_Name}
  Sleep  2s
  Click Item   //img[contains(@src,'/sfdms/images/kms-edit.svg')]
  Sleep  5s
  Set Input    //input[@id='filed_mbookletName']      ${Rename_Material_Name}
  Sleep  4s
  Set Input     //input[@id='filed_qaQuestion']   ${Question}
  Set Input     //textarea[@id='filed_qaAnswer']   ${Answer}
  Sleep  4s
  Click Item     //div[@id='selectfield_qaTag']//div[@class='select-form__indicator select-form__clear-indicator css-tlfecz-indicatorContainer']
  Set Dropdown4   (//input[@class='select-form__input'])[2]    ${Add Tags}
  Set Dropdown3  (//input[@class='select-form__input'])[3]        ${FilterType}
  Sleep  4s
  #Click Item         //input[@name='effectiveDate']
  #Set Date        ${EffectiveDate}
  Execute Javascript    var xpath = document.evaluate("//div[@class='drop-zone']/input", document,null,XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue.style.setProperty('display', 'block');
  Sleep  10s
  File Uplaod    //div[@class="drop-zone"]//input      ${FilePath}
  Click Item   //div[normalize-space()='Update']
  Sleep  5s


Add Shedule To Program Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Shedule_SaleForceMbooklet   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
    ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel



  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  #Sleep  3s
  #Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Date    //input[@name='start_date']   ${StartDate}
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='View']
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}

    IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Set Dropdown3   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
  Set Dropdown3    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  5s
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END


Add Shedule To VideoOnDemand Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Shedule_SaleForceMbooklet   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
  ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel



  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  #Sleep  3s
  #Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Date    //input[@name='start_date']   ${StartDate}
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='View']
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}

  IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Set Dropdown3   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
  Set Dropdown3    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  5s
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  #Set Dropdown3   (//label[normalize-space()='Region']/following-sibling::div//div)[2]    ${Region}
  #Set Dropdown3   (//label[normalize-space()='Cluster']/following-sibling::div//div)[2]    ${Cluster}
  #Set Dropdown3   (//label[normalize-space()='Outlet Type']/following-sibling::div//div)[2]    ${OutletType}
  #Set Dropdown3   (//label[normalize-space()='Outlet Class']/following-sibling::div//div)[2]    ${OutletClass}
  #Set Dropdown3   (//label[normalize-space()='Outlet']/following-sibling::div//div)[2]    ${Outlet}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END



Add Shedule To TipsAndTricks Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Shedule_SaleForceMbooklet   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
  ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel



  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  #Sleep  3s
  #Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Date    //input[@name='start_date']   ${StartDate}
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='View']
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}


  IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Set Dropdown3   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
  Set Dropdown3    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  5s
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  #Set Dropdown3   (//label[normalize-space()='Region']/following-sibling::div//div)[2]    ${Region}
  #Set Dropdown3   (//label[normalize-space()='Cluster']/following-sibling::div//div)[2]    ${Cluster}
  #Set Dropdown3   (//label[normalize-space()='Outlet Type']/following-sibling::div//div)[2]    ${OutletType}
  #Set Dropdown3   (//label[normalize-space()='Outlet Class']/following-sibling::div//div)[2]    ${OutletClass}
  #Set Dropdown3   (//label[normalize-space()='Outlet']/following-sibling::div//div)[2]    ${Outlet}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END


Add Shedule To Q&A Sales Force Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Shedule_SaleForceMbooklet   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
  ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel



  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  #Sleep  3s
  #Click Item   //ul[contains(@class,'side-submenu-container')]//li[2]
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Date    //input[@name='start_date']   ${StartDate}
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='View']
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}

  IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Set Dropdown3   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
  Set Dropdown3    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  5s
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  #Set Dropdown3   (//label[normalize-space()='Region']/following-sibling::div//div)[2]    ${Region}
  #Set Dropdown3   (//label[normalize-space()='Cluster']/following-sibling::div//div)[2]    ${Cluster}
  #Set Dropdown3   (//label[normalize-space()='Outlet Type']/following-sibling::div//div)[2]    ${OutletType}
  #Set Dropdown3   (//label[normalize-space()='Outlet Class']/following-sibling::div//div)[2]    ${OutletClass}
  #Set Dropdown3   (//label[normalize-space()='Outlet']/following-sibling::div//div)[2]    ${Outlet}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END



Add Shedule To Product in Outlet Mbooklet
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  Shedule_SaleForceMbooklet   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${Rename_Material_Name}=  getData  ${data}  Rename_Material_Name
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
  ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel
  ${Region}=  getData  ${data}  Region
  ${Cluster}=  getData  ${data}  Cluster
  ${OutletType}=  getData  ${data}  OutletType
  ${OutletClass}=  getData  ${data}  OutletClass
  ${Outlet}=  getData  ${data}  Outlet


  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item    //a[normalize-space()='Outlet M-booklet']
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Rename_Material_Name}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Date    //input[@name='start_date']   ${StartDate}
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='View']
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}

  IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Set Dropdown3   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
  Set Dropdown3    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  5s
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  #Set Dropdown3   (//label[normalize-space()='Region']/following-sibling::div//div)[2]    ${Region}
  #Set Dropdown3   (//label[normalize-space()='Cluster']/following-sibling::div//div)[2]    ${Cluster}
  #Set Dropdown3   (//label[normalize-space()='Outlet Type']/following-sibling::div//div)[2]    ${OutletType}
  #Set Dropdown3   (//label[normalize-space()='Outlet Class']/following-sibling::div//div)[2]    ${OutletClass}
  #Set Dropdown3   (//label[normalize-space()='Outlet']/following-sibling::div//div)[2]    ${Outlet}
  Click Item     //div[normalize-space()='Save']
  Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END


Create Banner of Type External
   [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  BannerConfiguration   ${caseID}  ${dataID}
  ${Title}=  getData  ${data}  Title
  ${Position}=  getData  ${data}  Position
  ${IdentifierType}=  getData  ${data}  IdentifierType
  ${BannerURL}=  getData  ${data}  BannerURL
  ${FileName}=  getData  ${data}  FileName
  ${Identifier}=  getData  ${data}  Identifier
  ${FilePath}=  getData  ${data}  FilePath

  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item    //a[normalize-space()='Banner Configuration']
  Sleep  25s
  Click Item    //div[contains(@class,'btn-md float-right margin-left')]
  Set Input      //input[@id='filed_title']   ${Title}
  Sleep  5s
  Set Dropdown3   (//label[normalize-space()='Position']/following-sibling::div//div)[2]     ${Position}
  Set Dropdown3     (//label[normalize-space()='Identifier Type']/following-sibling::div//div)[2]   ${IdentifierType}
  Set Input        //input[@id='filed_bannerURL']  ${BannerURL}
  Set Input        //input[@id='filed_fileName']   ${FileName}
  File Uplaod   //input[@id='filed_file']   ${FilePath}
  Click Item    //div[normalize-space()='Add']
  Sleep  5s


Edit Banner of Type External
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  BannerConfiguration   ${caseID}  ${dataID}
  ${Title}=  getData  ${data}  Title
  ${Position}=  getData  ${data}  Position
  ${IdentifierType}=  getData  ${data}  IdentifierType
  ${EndTime}=  getData  ${data}  BannerURL
  ${FileName}=  getData  ${data}  FileName
  ${Identifier}=  getData  ${data}  Identifier
  ${FilePath}=  getData  ${data}  FilePath
  ${NewTitle}=  getData  ${data}  NewTitle

  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item    //a[normalize-space()='Banner Configuration']
  #Sleep  17s
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Title}
  Sleep  2s
  Click Item   //img[@class='cursor-pointer']
  Set Input      //input[@id='filed_title']   ${NewTitle}
  Sleep  2s
  Set Dropdown3  (//label[normalize-space()='Position']/following-sibling::div//div)[2]     ${Position}
  Sleep  2s
  Set Dropdown3    (//label[normalize-space()='Identifier Type']/following-sibling::div//div)[2]   ${IdentifierType}
  Sleep  2s
  Set Input        //input[@id='filed_fileName']   ${FileName}
  File Uplaod   //input[@id='filed_file']   ${FilePath}
  Click Item      //div[normalize-space()='Update']

Create Banner of Type Internal
   [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  BannerConfiguration   ${caseID}  ${dataID}
  ${Title}=  getData  ${data}  Title
  ${Position}=  getData  ${data}  Position
  ${IdentifierType}=  getData  ${data}  IdentifierType
  ${BannerURL}=  getData  ${data}  BannerURL
  ${FileName}=  getData  ${data}  FileName
  ${Identifier}=  getData  ${data}  Identifier
  ${FilePath}=  getData  ${data}  FilePath

  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item    //a[normalize-space()='Banner Configuration']
  #Sleep  17s
  Click Item    //div[contains(@class,'btn-md float-right margin-left')]
  Set Input      //input[@id='filed_title']   ${Title}
  Sleep  5s
  Set Dropdown3   (//label[normalize-space()='Position']/following-sibling::div//div)[2]     ${Position}
  Sleep  2s
  Set Dropdown3     (//label[normalize-space()='Identifier Type']/following-sibling::div//div)[2]   ${IdentifierType}
  Sleep  4s
  Set Dropdown3     (//label[normalize-space()='Identifier']/following-sibling::div//div)[2]    ${Identifier}
  Sleep  2s
  Set Input        //input[@id='filed_fileName']   ${FileName}
  File Uplaod   //input[@id='filed_file']   ${FilePath}
  Click Item    //div[normalize-space()='Add']
  Sleep  10s

Edit Banner of Type Internal
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  BannerConfiguration   ${caseID}  ${dataID}
  ${Title}=  getData  ${data}  Title
  ${Position}=  getData  ${data}  Position
  ${IdentifierType}=  getData  ${data}  IdentifierType
  ${EndTime}=  getData  ${data}  BannerURL
  ${FileName}=  getData  ${data}  FileName
  ${Identifier}=  getData  ${data}  Identifier
  ${FilePath}=  getData  ${data}  FilePath
  ${NewTitle}=  getData  ${data}  NewTitle

  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item    //a[normalize-space()='Banner Configuration']
  #Sleep  17s
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Title}
  Sleep  2s
  Click Item   //img[@class='cursor-pointer']
  Set Input      //input[@id='filed_title']   ${NewTitle}
  Sleep  2s
  Set Dropdown3  (//label[normalize-space()='Position']/following-sibling::div//div)[2]     ${Position}
  Sleep  2s
  Set Dropdown3    (//label[normalize-space()='Identifier Type']/following-sibling::div//div)[2]   ${IdentifierType}
  Sleep  2s
  Set Dropdown3     (//label[normalize-space()='Identifier']/following-sibling::div//div)[2]    ${Identifier}
  Set Input        //input[@id='filed_fileName']   ${FileName}
  File Uplaod   //input[@id='filed_file']   ${FilePath}
  Click Item      //div[normalize-space()='Update']

Add Shedule To Banner of Type External
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  BannerConfiguration   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
  ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel
  ${Title}=  getData  ${data}  Title



  Click Item     ${BeliPacketDetailsPage}[Apps]
  Sleep  2s
  Click Item     //span[normalize-space()='KMS']
  Sleep  5s
  Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  Sleep  3s
  Click Item    //a[normalize-space()='Banner Configuration']
  Sleep  25s
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Title}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Month      //input[@name='start_date']  September
  Sleep  5s
  Set Date    //input[@name='start_date']   ${StartDate}
  Sleep  2s
  Set Month     //input[@name='end_date']     September
  Sleep  4s
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}

  IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  #Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Set Dropdown4   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
 # Set Dropdown4    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  5s
  Click Item     //div[normalize-space()='Save']
  #Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  #Set Dropdown3   (//label[normalize-space()='Region']/following-sibling::div//div)[2]    ${Region}
  #Set Dropdown3   (//label[normalize-space()='Cluster']/following-sibling::div//div)[2]    ${Cluster}
  #Set Dropdown3   (//label[normalize-space()='Outlet Type']/following-sibling::div//div)[2]    ${OutletType}
  #Set Dropdown3   (//label[normalize-space()='Outlet Class']/following-sibling::div//div)[2]    ${OutletClass}
  #Set Dropdown3   (//label[normalize-space()='Outlet']/following-sibling::div//div)[2]    ${Outlet}
  Click Item     //div[normalize-space()='Save']
  Sleep  15s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END
  Sleep  10s


Add Shedule To Banner of Type Internal
  [Arguments]     ${caseID}  ${dataID}

  ${data}=  Fetch From Excel  ${SMARTFREN_TESTDATA}  BannerConfiguration   ${caseID}  ${dataID}
  ${StartDate}=  getData  ${data}  StartDate
  ${EndDate}=  getData  ${data}  EndDate
  ${StartTime}=  getData  ${data}  StartTime
  ${EndTime}=  getData  ${data}  EndTime
  ${Participants}=  getData  ${data}  Participants
  ${BulkUploadFilePath}=  getData  ${data}  BulkUploadFilePath
  ${UserGroup}=  getData  ${data}  UserGroup
  ${EmployeeId}=  getData  ${data}  EmployeeId
  ${Type}=  getData  ${data}  Type
  ${Channel}=  getData  ${data}  Channel
  ${Title}=  getData  ${data}  Title



  #Click Item     ${BeliPacketDetailsPage}[Apps]
  #Sleep  2s
  #Click Item     //span[normalize-space()='KMS']
  #Sleep  5s
  #Click Item   (//img[@src='/sfdms/images/menus/inventory.svg'])[1]
  #Sleep  3s
  #Click Item    //a[normalize-space()='Banner Configuration']
  #Sleep  25s
  Click Item   (//i[@class='fa fa-search'])[2]
  Set Input    //input[@class='data-Table-common_search form-control-sm form-control']    ${Title}
  Sleep  2s
  Click Item   //img[@class='kms-table-link-img ml-1 cursor-pointer']
  #Click Item    //button[normalize-space()='Add']
  Set Month      //input[@name='start_date']  September
  Sleep  5s
  Set Date    //input[@name='start_date']   ${StartDate}
  Sleep  2s
  Set Month     //input[@name='end_date']     September
  Sleep  4s
  Set Date      //input[@name='end_date']    ${EndDate}
  Start Time   //input[@name='start_time']    ${StartTime}
  End Time     //input[@name='end_time']      ${EndTime}
  Click Item     //label[text()='Web']
  Click Item     //label[text()='Mobile']
  Set Dropdown3   //div[@class='select-form__input-container css-ackcql']     ${Participants}

  IF    '${Participants}' == 'Bulk Upload'
  File Uplaod      //input[@id='filed_bulkUpload']   ${BulkUploadFilePath}
  Click Item     //div[normalize-space()='Save']
  #Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'User Wise'
  Sleep  4s
  Set Dropdown3   (//label[normalize-space()='User Group']/following-sibling::div//div)[2]   ${UserGroup}
  Sleep  7s
  #Set Dropdown3    //div[text()='6D Admin']    ${EmployeeId}
  Sleep  2s
  Click Item     //div[normalize-space()='Save']
  #Handle PopUp    //p[@class='kms-success-icon-caption mt-2']    Schedule Saved
  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END

  IF    '${Participants}' == 'Basic Selection'
  Set Dropdown3   (//label[normalize-space()='Type']/following-sibling::div//div)[2]   ${Type}
  Set Dropdown3   (//label[normalize-space()='Channel']/following-sibling::div//div)[2]    ${Channel}
  Click Item     //div[normalize-space()='Save']

  Sleep  4s
  Click Item   //div[contains(@class,'btn-md float-center margin-left')]
  END
  Sleep  10s




















  


























