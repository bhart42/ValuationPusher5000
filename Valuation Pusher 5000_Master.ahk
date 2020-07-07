/*
$$\    $$\          $$\                      $$\     $$\                           $$$$$$$\                      $$\                                 
$$ |   $$ |         $$ |                     $$ |    \__|                          $$  __$$\                     $$ |                                
$$ |   $$ |$$$$$$\  $$ |$$\   $$\  $$$$$$\ $$$$$$\   $$\  $$$$$$\  $$$$$$$\        $$ |  $$ |$$\   $$\  $$$$$$$\ $$$$$$$\   $$$$$$\   $$$$$$\        
\$$\  $$  |\____$$\ $$ |$$ |  $$ | \____$$\\_$$  _|  $$ |$$  __$$\ $$  __$$\       $$$$$$$  |$$ |  $$ |$$  _____|$$  __$$\ $$  __$$\ $$  __$$\       
 \$$\$$  / $$$$$$$ |$$ |$$ |  $$ | $$$$$$$ | $$ |    $$ |$$ /  $$ |$$ |  $$ |      $$  ____/ $$ |  $$ |\$$$$$$\  $$ |  $$ |$$$$$$$$ |$$ |  \__|      
  \$$$  / $$  __$$ |$$ |$$ |  $$ |$$  __$$ | $$ |$$\ $$ |$$ |  $$ |$$ |  $$ |      $$ |      $$ |  $$ | \____$$\ $$ |  $$ |$$   ____|$$ |            
   \$  /  \$$$$$$$ |$$ |\$$$$$$  |\$$$$$$$ | \$$$$  |$$ |\$$$$$$  |$$ |  $$ |      $$ |      \$$$$$$  |$$$$$$$  |$$ |  $$ |\$$$$$$$\ $$ |            
    \_/    \_______|\__| \______/  \_______|  \____/ \__| \______/ \__|  \__|      \__|       \______/ \_______/ \__|  \__| \_______|\__|            
                                                                                                                                                    
                                                                                                                                                    
                                                                                                                                                    
                                                $$$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\                                                               
                                                $$  ____| $$$ __$$\ $$$ __$$\ $$$ __$$\                                                              
                                                $$ |      $$$$\ $$ |$$$$\ $$ |$$$$\ $$ |                                                             
                                                $$$$$$$\  $$\$$\$$ |$$\$$\$$ |$$\$$\$$ |                                                             
                                                \_____$$\ $$ \$$$$ |$$ \$$$$ |$$ \$$$$ |                                                             
                                                $$\   $$ |$$ |\$$$ |$$ |\$$$ |$$ |\$$$ |                                                             
                                                \$$$$$$  |\$$$$$$  /\$$$$$$  /\$$$$$$  /                                                             
                                                 \______/  \______/  \______/  \______/                                                              
                                                                                                                                                


        :::   :::       :::      :::::::: ::::::::::: :::::::::: :::::::::          ::::::::   ::::::::  :::::::::  ::::::::::: ::::::::: ::::::::::: 
      :+:+: :+:+:    :+: :+:   :+:    :+:    :+:     :+:        :+:    :+:        :+:    :+: :+:    :+: :+:    :+:     :+:     :+:    :+:    :+:      
    +:+ +:+:+ +:+  +:+   +:+  +:+           +:+     +:+        +:+    +:+        +:+        +:+        +:+    +:+     +:+     +:+    +:+    +:+       
   +#+  +:+  +#+ +#++:++#++: +#++:++#++    +#+     +#++:++#   +#++:++#:         +#++:++#++ +#+        +#++:++#:      +#+     +#++:++#+     +#+        
  +#+       +#+ +#+     +#+        +#+    +#+     +#+        +#+    +#+               +#+ +#+        +#+    +#+     +#+     +#+           +#+         
 #+#       #+# #+#     #+# #+#    #+#    #+#     #+#        #+#    #+#        #+#    #+# #+#    #+# #+#    #+#     #+#     #+#           #+#          
###       ### ###     ###  ########     ###     ########## ###    ###         ########   ########  ###    ### ########### ###           ###           
                                                                                                                                                
Created by Brian Hart @ all rights reserved
PitchBook Data Inc.
Fight Club Research Team
Please contact Brian.Hart@pitchbook.com to report any issues or update requests regarding this script or if you'd just like to talk. 
*/
;                                                          -----TABLE OF CONTENTS-----
; ###############################################################################################################################################

; 1. Initialization Settings 
; 2. Import Statements
; 3. Script Control Functions
; 4. RTS General Functions
; 5. RTS Round Functions
; 6. Internal Note Functions
; 7. External Note Functions
; 8. Act Log Functions
; 9. FC Research Request Functions

;                                                       -----INITIALIZATION SETTINGS-----
; ###############################################################################################################################################

; User's Initials
;
; Prompts the user to input their initials before using the script.
;
user_initials:
    WinGetPos, x, y, width, height, A
    centerx := x + ((width / 2) - 150)
    centery := y + ((height / 2) - 75)
    InputBox, user_initials, User, Please input` your initials, , 300, 150, %centerx%, %centery%

; Initialize Dataset
;
; Prompts the user upon opening the script which dataset they're working on.
;
; Dataset Options:
;   us = United States
;   uk = United Kingdom
;   fr = France
;   g = Germany
;   b = Belgium
;   s = Switzerland
;   i = Israel
;   fi = Finland 
; 
initialize_dataset:
    WinGetPos, x, y, width, height, A
    centerx := x + ((width / 2) - 150)
    centery := y + ((height / 2) - 155)
    InputBox, dataset, Switch dataset, Which Dataset would you like to work on?`nus =`tUnited States`nuk =`tUnited Kingdom`nfr =`tFrance`ng =`tGermany`nb =`tBelgium`ns =`tSwitzerland`ni =`tIsrael`nfi =`tFinland,,300,310, %centerx%, %centery%
    dataset := get_dataset_name(dataset) 
return

;                                                          -----IMPORT STATEMENTS-----
; ###############################################################################################################################################

; Inlcudes the Valuation Pusher 5000 US script and Valuation Pusher 5000 EU script. 
; For documentation of these scripts please open the corresponding files or consult Confluence. 
;
#Include, Valuation Pusher 5000_US.ahk
#Include, Valuation Pusher 5000_EU.ahk
#MenuMaskKey vk00sc000

;                                                       -----SCRIPT CONTROL FUNCTIONS-----
; ###############################################################################################################################################

; Swith Dataset: Left Alt + d
;
; Allows the user to swith between datasets.  Certain functions change output based on the dataset that's selected.
; For documentation of such changes, please refer to the functions individually or consult Confluence.
;
switch_dataset:
LAlt & d::
    WinGetPos, x, y, width, height, A
    centerx := x + ((width / 2) - 150)
    centery := y + ((height / 2) - 155)
    InputBox, dataset, Switch dataset, Current Dataset: %dataset%`n`nWhich Dataset would you like to switch to?`nus =`tUnited States`nuk =`tUnited Kingdom`nfr =`tFrance`ng =`tGermany`nb =`tBelgium`ns =`tSwitzerland`ni =`tIsrael`nfi =`tFinland,,300,310, %centerx%, %centery%
    dataset := get_dataset_name(dataset)
    if dataset not in United States,United Kingdom,France,Germany,Belgium,Switzerland,Israel
    Loop {
        InputBox, dataset, Switch Dataset, Incorrect input`, please select a dataset from the following options:`nus =`tUnited States`nuk =`tUnited Kingdom`nfr =`tFrance`ng =`tGermany`nb =`tBelgium`ns =`tSwitzerland`ni =`tIsrael`nfi =`tFinland,,300,310, %centerx%, %centery%
        dataset := get_dataset_name(dataset)
    } Until dataset in United States,United Kingdom,France,Germany,Belgium,Switzerland,Israel,Finland
return
  
; Pause Script: Window's key + p
; 
; Pauses execution of the script.
;
pause_script: 
#p::
    Pause
return

; Exit Script: Control + Escape
;
; Ends execution of the script.
;
exit_script:
^Esc::
    ExitApp
return

;                                                        -----RTS GENERAL FUNCTIONS-----
; ###############################################################################################################################################

; Sign In: Control + Shift + s
;
; Starting Position: Username text box on RTS sign in alert box
;
; Enters the user's initials, password, and presses Enter on the login button.
; Password supplied .
;
sign_in:
^+s::
    SendInput, %user_initials%
    SendInput, {Tab}
    password := get_password()
    SendInput, %password%
    SendInput, {Tab}
    SendInput, {Enter}
return

; Today's Date: td + Space
;
; Prints today's date in the format Month/Day/Year (M/D/YY)
;
todays_date:
::td::
    FormatTime, ShortTime,, M/d/yy
    SendInput, %ShortTime%
return

; Auto Timestamp/Initials: Shift + Control + d
; 
; Prints today's date along with the user's initials
;
auto_timestamp:
^+d::
    Gosub, todays_date
    SendInput, {Space}%user_initials%:{Space}
return

; Series Seed: s + s
; 
; Starting Position: Internal note in Company Tab or internal/external note in Round Details window.
;
series_seed:
::ss::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, Seed{Space}
    }
return

; Series A: s + a
; 
; Starting Position: Internal note in Company Tab or internal/external note in Round Details window.
;
series_a:
::sa::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, Series A{Space}
    }
return

; Series B: s + b
; 
; Starting Position: Internal note in Company Tab or internal/external note in Round Details window.
;
series_b:
::sb::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, Series B{Space}
    }
return

; Series C: s + c
; 
; Starting Position: Internal note in Company Tab or internal/external note in Round Details window.
;
series_c:
::sc::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, Series C{Space}
    }
return

; Series D: s + d
; 
; Starting Position: Internal note in Company Tab or internal/external note in Round Details window.
;
series_d:
::sd::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, Series D{Space}
    }
return

; Series E: s + e
; 
; Starting Position: Internal note in Company Tab or internal/external note in Round Details window.
;
series_e:
::se::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, Series E{Space}
    }
return

; Million: m + i
;
; Starting Position: Internal/external note in Company Tab or internal/external note in Round Details window.
;
million:
::mi::
  SendInput, million
Return

;                                                         -----RTS ROUND FUNCTIONS-----
; ###############################################################################################################################################                                             

; Create New Dummy Round: Shift + Control + u
;
; Starting Position: RTS Company tab > Rounds section > Round number field on a newly created round
;
; Prompts the user for the Round Type and populates the fields on a newly 
; created Dummy round.  Currency is adjusted based on the dataset
; selected. Inserts a note indicating the origin of the round as the 
; Valuations Operations team for that dataset.
;
dummy_round:
^+u::
	if WinActive("PitchBook RTS") {
		WinGetPos, x, y, width, height, A
    	centerx := x + ((width / 2) - 150)
    	centery := y + ((height / 2) - 155)
    	InputBox, round, Round Type?, What type of dummy round would you like to create?`ns =`tSeed`ne =`tEarly Stage`nl =`tLate Stage,,300,310, %centerx%, %centery%
		SendInput, {Tab}
		SendInput, Completed
		SendInput, {Tab}
		if (round = "s") {
			SendInput, Seed Round
		}
		else if (round = "e") {
			SendInput, Early Stage VC
		}	
		else if (round = "l") {
			SendInput, Late Stage VC
		}
		SendInput, {Tab 5}
		Sleep, 300
		SendInput, Estimated
		SendInput, {Tab 2}
		Sleep, 300
		SendInput, Fight Club
		SendInput, {Tab}
		if (dataset = "United States") or (dataset = "Israel") {
			SendInput, US Dollars	
		} 
		else if (dataset = "United Kingdom") {
			SendInput, British Pounds	
		}
		else if (dataset = "France") or (dataset = "Belgium") or (dataset = "Germany") or (dataset = "Finland") {
			SendInput, Euros		
		}		
		else if (dataset = "Switzerland") {
			SendInput, Swiss Francs		
		}
		SendInput, {Tab}
		Gosub, auto_timestamp	
		SendInput, Added round via %dataset% Valuations Ops. ///	
	}
return

; Estimated Round: Shift + Control + `
;
; Starting Position: Round Details window
;
; Sets the PV Confirm field to Estimated and adds language to the External Note
; that the valuation was estimated.
;
estimated_round:
^+`::
	if WinActive("Round Details") {
		SendInput, ^f
		Sleep, 200
		SendInput, PV Confirm
		Sleep, 200
		SendInput, {Escape}
		SendInput, {Tab 2}
		Sleep, 200
		SendInput, Estimated
		SendInput, {Enter}
		Sleep, 200
        SendInput, ^f
        Sleep, 200
        SendInput, Price Per Share
        SendInput, {Escape}
        SendInput, {Tab}
        SendInput, ^a
        SendInput, {Delete}
        Sleep, 200
        SendInput, ^f
        Sleep, 200
        SendInput, Valuation
        Sleep, 200
        SendInput, {Enter}
        Sleep, 200
        SendInput, {Escape}
        SendInput, {Tab}
        SendInput, WH News 
		SendInput, ^f
		Sleep, 200
		SendInput, valuation at
		Sleep 200
		SendInput, {Escape}
		SendInput, {Right}
		SendInput, {Space}
		Gosub, an_estimated
		SendInput, {Backspace}
	}	
return

; Round with Debt Assumption: Shift + Control + .
;
; Starting Position: Round Details window > External Note
;
; Adds language to the external note that the round amount contains a
; combination of debt and equity.
;
debt_round:
^+.::
	if WinActive("Round Details") {
		SendInput, ^a
		SendInput, ^f
		Sleep, 200
		SendInput, Generate External Note
		Sleep, 200
		SendInput, {Escape}
		SendInput, +{Tab 2}
		SendInput, ^a
		SendInput, {Left}
		SendInput, ^f
		Sleep, 200
		SendInput, of
		Sleep, 200
		SendInput, {Escape}
		SendInput, {Left}
		Gosub, through_the_combination
		SendInput, {Right 2}
		SendInput, {Space}debt and
	}
return

;                                                       -----INTERNAL NOTE FUNCTIONS-----
; ###############################################################################################################################################

; Val Added: v + a + s
;
; Starting Position: Internal note in Company Tab or internal note in Round Details window.
;
val_added:
::vas::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, val added
    }
return

; Val Adjusted: v + a + j
;
; Starting Position: Internal note in Company Tab or internal note in Round Details window.
;
val_adjusted:
::vaj::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        SendInput, val adjusted. ///
    }
Return

; Added Valuation: f + d
;
; Starting Position: Internal note in Company Tab or internal note in Round Details window.
; 
; Prints the date, user's initials, and the message "val added. ///"
;
added_valuation:
::fd::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") {
        Gosub, auto_timestamp
        Gosub, val_added
        SendInput, . ///
    }   
return

; Out of Scope: o + o + s
; 
; Starting Position: Internal note in Company Tab or internal note in Round Details window.
;
out_of_scope:
::oos::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") { 
        SendInput, val out of scope. /// 
    }
return

; Fight Club Debt: d + f + c
;
; Starting Position: Internal note in Company Tab or internal note in Round Details window.
;
fightclub_debt:
::dfc::
  SendInput, debt assumed per FC Methodology. ///
Return

;                                                       -----EXTERNAL NOTE FUNCTIONS-----
; ###############################################################################################################################################

; Pre-money Valuation: p + m + v
;
; Starting Position: Immediately after the date in the external note.
;
premoney_valuation:
::pmv::
  SendInput,, putting the company's pre-money valuation at $
return

; An Estimated: e + s + t
;
; Starting Position: Immediately before the currency sign (EUR, $, etc)
; of the valuation figure in the external note.
;
an_estimated:
::est::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") or WinActive("Round Details") { 
        SendInput, an estimated{Space}
    }
Return

; Through the Combination: t + t + c
; 
; Starting Position: Immediately before "of ____ funding" in the external note.
;
through_the_combination:
::ttc::
    SendInput, through the combination{Space}
Return

;                                                          -----ACT LOG FUNCTIONS-----
; ###############################################################################################################################################                                             

; Act log settings: Shift + Control + a
;
; Starting Position: "Target Date" field 
; 
; Inputs settings into a new act log.
;
; Prompts the user for Act Log Type:
;   nc = New Company
;   nr = New Round
;   rr = Research Request  
; Process: Fight Club
; Status: Pend Secondary
; Roadblock: Clear
; Priority: 
;   Client Request: High
;   New Round/New Company: Regular
; Region (dependent on dataset): 
;   US = North America
;   Israel = Israel
;   All other datasets = Europe
; Secondary By: [Blank]   
; Lead QA By: [Blank] 
; Primary By: [Blank]
;
act_log_settings:
^+a::
    if WinActive("PitchBook RTS") {
        WinGetPos, x, y, width, height, A
        centerx := x + ((width / 2) - 150)
        centery := y + ((height / 2) - 155)
        InputBox, workflow, Workflow?, Which workflow would you like to create an act log for?`nnc =`tNew Company`nnr =`tNew Round`nrr = `tResearch Request,,300,310, %centerx%, %centery%
        SendInput, {Tab 2}
        SendInput, +{Tab 2}
        Sleep, 500
        SendInput {Tab}
        if (workflow = "nc") {
            SendInput, Co VC - New Company
        }
        else if (workflow = "nr") {
            SendInput, Co VC - New Round
        }
        else if (workflow = "rr") {
            SendInput, {Home}
        }
        SendInput {Tab}
        SendInput, Fight Club
        SendInput {Tab}
        SendInput, Pend Secondary
        SendInput {Tab}
        SendInput, Clear
        SendInput {Tab}
        if (workflow = "rr") {
            SendInput, High
        } else {
            SendInput, Regular
        }
        SendInput {Tab}
        if (dataset = "United States") {
            SendInput, North America
        } if (dataset = "Israel") {
            SendInput, Israel
        } else {
            SendInput, Europe
        }
        SendInput {Tab 3}
        Gosub, auto_timestamp
        act_log_notes(dataset, workflow)
        SendInput, {Tab 6}
        Gosub, auto_timestamp
        act_log_notes(dataset, workflow)
    }
return

; Client Request: c + r + c 
;
; Starting Position: Act log notes text field
; 
client_request:
::crc::
    SetTitleMatchMode, 2
    if WinActive("PitchBook RTS") {
        SendInput, Client Request. ///  
    }    
return

;                                                    -----FC RESEARCH REQUEST FUNCTIONS-----
; ###############################################################################################################################################

; Company Not In Scope: n + i + s
;
; Starting Position: Salesforce Client Request comment box
;
; Prints a message stating the that current company is out of scope
; and waits for user input of the country name. Once input, press
; the "," key to continue printing an explanation of the current scope
; of Fight Club research.
; 
company_not_in_scope:
::nis::
    SetTitleMatchMode, 2
    if WinActive("Salesforce - Google Chrome") {
        SendInput, Fight Club cannot add a valuation on the company at this time because the company is incorporated in{Space}
        KeyWait `,, D
        SendInput, {Space}which is currently out of Fight Club's scope. Fight Club's current scope includes the US, UK, France, Belgium, Switzerland, Israel, and is expanding into additional European countries.{Space}  
        Gosub, let_me_know  
    }
return


; Valuation Methodology: valm
;
; Starting Position: Salesforce Client Request comment box
;
; Prints a message explaining Fight Club's research methodology
;
valuation_methodology:
::valm::
    SetTitleMatchMode, 2
    if WinActive("Salesforce - Google Chrome") {
        SendInput, {Text}We gather valuations from a variety of public sources and direct outreach to the companies. If we're unable to find a company's valuation via public sources, we calculate it using information from corporate and regulatory filings, and a proprietary formula that's similar to calculating market cap for a public company. This formula takes into account factors like actual share price, # of shares authorized and issued, as well as potential option pool sizes.
        SendInput, {Return}
        SendInput, {Text}With this, our team is able to come to a conclusive number that (based on feedback and on-going QA tests) generally falls within a five to ten percent margin of error.
        SendInput, {Return}
        SendInput, {Text}The next step of our research process is critical: after receiving new information about a company (valuations or other), our research team contacts the company's executives for verification and additional information.
        SendInput, {Return}
        SendInput, {Text}At this point, the company has full power to update or correct any information on their PitchBook profile, including their valuation.
        SendInput, {Space}
        Gosub, let_me_know  
    }
return

; Can't Push Valuation: cpv
;
; Starting Position: Salesforce Client Request comment box
;
cant_push_valuation:
::cpv::
    SetTitleMatchMode, 2
    if WinActive("Salesforce - Google Chrome") {
        SendInput, Fight Club is unable to complete a valuation or provide cap table information at this time.
        SendInput, {Space}
        Gosub, let_me_know  
    } 
return

; Valuation Completed: valc
;
; Starting Position: Salesforce Client Request comment box
;
valuation_completed:
::valc::
    SetTitleMatchMode, 2
    if WinActive("Salesforce - Google Chrome") {
        SendInput, Fight club was able to complete a valuation  
    }
return

; Publish Cap Table: capc
;
; Starting Position: Salesforce Client Request comment box
;
publish_cap_table:
::capc::
    SetTitleMatchMode, 2
    if WinActive("Salesforce - Google Chrome") {
        SendInput, and publish cap table information{!} Updates will be posted to the platform shortly.  
    }
return

; Let Me Know: l + m + k
;
; Starting Position: Salesforce Client Request comment box
;                                          
let_me_know:
::lmk::
    SetTitleMatchMode, 2
    if WinActive("Salesforce - Google Chrome") {
        SendInput, Please let me know if you have any further questions.   
    }
return