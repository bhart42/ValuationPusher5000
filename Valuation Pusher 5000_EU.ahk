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
                                                                                                                                                


				      :::::::::: :::    :::          :::::::::: ::::::::: ::::::::::: ::::::::::: ::::::::::: ::::::::  ::::    ::: 
				     :+:        :+:    :+:          :+:        :+:    :+:    :+:         :+:         :+:    :+:    :+: :+:+:   :+:  
				    +:+        +:+    +:+          +:+        +:+    +:+    +:+         +:+         +:+    +:+    +:+ :+:+:+  +:+   
				   +#++:++#   +#+    +:+          +#++:++#   +#+    +:+    +#+         +#+         +#+    +#+    +:+ +#+ +:+ +#+    
				  +#+        +#+    +#+          +#+        +#+    +#+    +#+         +#+         +#+    +#+    +#+ +#+  +#+#+#     
				 #+#        #+#    #+#          #+#        #+#    #+#    #+#         #+#         #+#    #+#    #+# #+#   #+#+#      
				##########  ########           ########## ######### ###########     ###     ########### ########  ###    ####       
                                                                                                                                                
Created by Brian Hart @ all rights reserved
PitchBook Data Inc.
Fight Club Research Team
Please contact Brian.Hart@pitchbook.com to report any issues or update requests regarding this script or if you'd just like to talk. 
*/
;  					                                       -----TABLE OF CONTENTS-----
; ###############################################################################################################################################

;	1. Fight Club Tool Functions 
;	2. Filings Purchasing Functions
;	3. General Language Functions

; ###############################################################################################################################################

; Import Statments:
;
#Include, Valuation Pusher 5000_Helper Functions.ahk
#Include, Valuation Pusher 5000_Private.ahk
#MenuMaskKey vk00sc000

;                                                      -----FIGHT CLUB TOOL FUNCTIONS-----
; ###############################################################################################################################################

; Shares Issued: s + h
;
; Starting Position: Notes section in the Fight Club Tool
;
; Prints a message denoting the currency of the shares that were issued.
; Currency changes based on dataset selected.
;
shares_issued:
::sh::
	if WinActive("Fight Club - Google Chrome") {
		if (dataset = "United States") or (dataset = "Israel") {
			SendInput, shares issued @ USD	
		}
		if (dataset = "United Kingdom") {
			SendInput, shares issued @ GBP	
		}
		if (dataset = "France") or (dataset = "Belgium") or (dataset = "Germany") or (dataset = "Finland") {
			SendInput, shares issued @ EUR	
		}
		if (dataset = "Switzerland") {
			SendInput, shares issued @ CHF	
		}
	}
return

; BSA Warrants Issued: Shift + Control + w
;
; Starting Position: Notes section in the Fight Club Tool
;
warrants_issued:
^+w::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, with BSA warrants attached
	}
return

; BSA Warrants Exercised: d + u
;
; Starting Position: Notes section in the Fight Club Tool
;
warrants_exercised:
::du::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, due to exercise of BSA warrants	
	}
return

; Capital Realization: capreal
;
; Starting Position: Notes section in the Fight Club Tool
;
cap_realization:
::capreal::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, Capital increase definitively realized on	
	}
return

; Create Ordinary Share Class: Shift + Control + o
;
; Starting Position: Fight Club Tool window
;
; Creates a new share class called "Ordinary" and refreshes the page
;
ord_shares:
^+o::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^f
		Sleep 200
		SendInput, New Type
		Sleep 200
		SendInput, {Escape}
		SendInput, {Tab}
		SendInput, Ordinary
		SendInput, {Tab}
		SendInput, {Enter}
		SendInput, {F5}	
	}
return

; Create Dummy Share Class: Shift + Control + y
;
; Starting Position: Fight Club Tool window
;
; Creates a new share class called "Dummy" and refreshes the page
;
dummy_shares:
^+y::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^f
		Sleep 200
		SendInput, New Type
		Sleep 200
		SendInput, {Escape}
		SendInput, {Tab}
		SendInput, Dummy
		SendInput, {Tab}
		SendInput, {Enter}
		SendInput, {F5}	
	}
return
	
; Shares Issued at Incorporation: Shift + Control + i
;
; Starting Position: Notes section in the Fight Club Tool
;
; Copies the last row of the cap table into the notes section and appends
; a message indicating these shares were issued at par, at incorporation.
;
inc_note:
^+i::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^f
		Sleep 200
		SendInput, Add Type
		Sleep 200
		SendInput, {Escape}
		SendInput, +{Tab 6}
		Clipboard := ""
		SendInput, ^c
		ClipWait
		ParValue := clipboard
		SendInput, +{Tab}
		clipboard := ""
		SendInput, ^c
		ClipWait
		NumShares := clipboard
		SendInput, +{Tab 21}
		Gosub, auto_timestamp
		SendInput, %NumShares% ordinary{Space}
		Gosub, shares_issued
		SendInput, {Space}%ParValue% (par) at incorporation.	
	}
return

; Shares issued note: Shift + Control + n
;
; Starting Position: Notes section in the Fight Club Tool
;
; Copies the last row of the cap table into the notes section and appends
; a message indicating the share class, issue price, and if there was a 
; difference between shares authorized and issued (ie not fully diluted).
; If no share price is indicated, prints a "?".
;
; Please note that this function requires the share class name to be present
; in the cap table header.  If the share class was recently added to the cap
; table, a refresh of the FC Tool window might be necessary to populate it.
;
share_note:
^+n::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^f
		Sleep 200
		SendInput, Add Type
		Sleep 200
		SendInput, {Escape}
		SendInput, +{Tab 3}
		Clipboard := ""
		SendInput, ^c
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "?"
		}
		OIP := Clipboard
		SendInput, +{Tab 4}
		Clipboard := ""
		SendInput, ^c
		ClipWait
		SharesOutstanding := Clipboard
		SendInput, +{Tab}
		Clipboard := ""
		SendInput, ^c
		ClipWait
		SharesAuthorized := Clipboard
		SendInput, ^f
		Sleep 200
		SendInput, Round {#}
		Sleep 200
		SendInput, {Tab}
		Sleep, 200
		SendInput, {Enter}
		Sleep, 200
		SendInput, {Escape}
		SendInput, ^+{Right 44}
		Clipboard := ""
		SendInput, ^c
		ClipWait
		element_str := Clipboard
		While element_str != "Update RTS" {
			SendInput, ^+{Right}
			Clipboard := ""
			SendInput, ^c
			ClipWait
			element_str := Clipboard
			element_str := SubStr(element_str, -9)
		}
		SendInput, ^+{Left 2}
		Clipboard := ""
		SendInput, ^c
		ClipWait
		table := Clipboard
		
		FC_round_info := get_FC_round_info(table)
		SendInput, ^f
		Sleep 200
		SendInput, Pages
		Sleep 200
		SendInput, {Escape}
		SendInput, {Tab 2}
		stock_series := FC_round_info["Stock`r`nSeries Type"]
		if (SharesOutstanding != SharesAuthorized) {
			SendInput, %SharesAuthorized%{Space}%stock_series%{Space}shares authorized 
			SendInput, {Space}and %SharesOutstanding%{Space} 
		} else {
			SendInput, %SharesOutstanding%{Space}%stock_series%{Space}
		}
		Gosub, shares_issued
		SendInput, {Space}%OIP% on{Space}	
	}
return

; Vanilla Round: v + Left Mouse Button
;
; Starting Position: FC Tool window > Update RTS button
;
; Takes the round information from the Fight Club tool, opens the 
; Round Details window, and updates the correct round accordingly.
;
; While this function allows for automated input, care should be taken
; to ensure quality.  Variable load times in RTS, section updates, etc
; greatly reduce the efficacy of this hotkey.
;
vanilla_round:
~LButton & v::
	Shiftkey := GetKeyState("Shift")
	Cntrlkey := GetKeyState("LCtrl") 
	if (Shiftkey == 1 && Cntrlkey == 1) {
		if WinActive("Fight Club - Google Chrome") {
			MouseGetPos, Px, Py
			MouseMove, 0, %Py%
			Click, 3
			SendInput, ^+{Left 2}
			Clipboard := ""
			SendInput, ^c
			ClipWait
			table := Clipboard
			FC_round_info := get_FC_round_info(table)
			switch_to_RTS_window()
			open_round_details(FC_round_info)
			round_note := get_round_note()
			Sleep, 1000
			refresh_RTS()
			is_last_round := last_round(FC_round_info)
			if (is_last_round = 1) {
				add_finstat_note(round_note)
			}
		}
	return
	}
return

; Test: Control + Alt + x 
;
; This function is used in developing new hotkeys.
; Current development: Moving Cap Tables
;
test:
^!x::	table := []
	SendInput, ^a
	Clipboard := ""
	SendInput, ^c
	ClipWait, 0.2
	test := Clipboard
	test := StrReplace(test, ",")
	counter := 0
	test_if_int := IsType(test, "integer")	
	while (test_if_int = 1) {
		current_row := []
		Loop, 8 {
			SendInput, ^a
			Clipboard := ""
			SendInput, ^c
			ClipWait, 0.2
			value := Clipboard
			current_row.Push(value)
			SendInput, {Tab}	
		}
		table.Push(current_row, theArray*)
		SendInput, {Tab}
		SendInput, ^a
		Clipboard := ""
		SendInput, ^c
		ClipWait, 0.2
		test := Clipboard
		test := StrReplace(test, ",")
		test_if_int := IsType(test, "integer")
		counter++	
	}
	Click
	SendInput, ^f
	Sleep 200
	SendInput, Add Type
	Sleep 200
	SendInput, {Tab}
	SendInput, {Enter}
	SendInput, {Escape}
	Sleep, 200
	SendInput, {Enter}
	Sleep, 500
	SendInput, {Tab}
	Sleep, 500
	MsgBox, %counter%
	Loop, counter {
		current_row := []
		current_row := table[A_Index]
		for key, value in current_row {
			MsgBox, %key% = %value%
		}
		Loop, 8 {
			num := current_row[A_Index]
			SendInput, num
			SendInput, {Tab}
		}
		SendInput, {Tab}
		SendInput, {Enter}
		Sleep, 200
		SendInput, {Tab}
	}
return

;                                                     -----FILINGS PURCHASING FUNCTIONS-----
; ###############################################################################################################################################

; Build Out Folders: Control + Shift + f
; 
; Starting Position: Cell in Excel spreadsheet containing company name. 
;
; Checks on a column in the spreadsheet that has the term "Purchased" 
; to verify if the company should be included in the directory. Creates 
; the indicated folders with the format of Name (pbID), each folder containing 
; another folder titled "$Translated". Removes Windows-prohibited characters
; from company folder names (\/:*?"<>|).
;
build_out_folders:
^+f::
	InputBox, loop_times, How many folders?, How many folders would you like to create?
	folders := []
	Loop, %loop_times% {  
	    SendInput, {Right 12}
	    Sleep, 200
	    SendInput, {F2}
	    Sleep, 200
	    SendInput, ^a
	    Clipboard := ""
	    SendInput, ^c
	    ClipWait
	    state := Clipboard
	    Sleep, 200
	    SendInput, {Escape}
	    SendInput, {Left 12}
	    Sleep, 200
    	if (state = "Purchased") {
    		folder_name := ""
    		Sleep, 200
    		SendInput, {F2}
    		Sleep, 200
    		SendInput, ^a
    		Clipboard := ""
			SendInput, ^c
			ClipWait
			comp_name := Clipboard
			SendInput, {Escape}
			SendInput, {Tab}
			Sleep, 200
			SendInput, {F2}
			Sleep, 200
			SendInput, ^a
			Clipboard := ""
			SendInput, ^c
			ClipWait
			pb_id := Clipboard
			SendInput, {Escape}
			folder_name = %comp_name% (%pb_id%)
			folders.Push(folder_name)
		}
    Sleep, 200
    SendInput, {Down}
    Sleep, 200
    SendInput, {Left}
	}
	WinActivate, ahk_class CabinetWClass
	SendInput, {F4}
	Sleep, 200
	SendInput, ^a
	Clipboard := ""
	SendInput, ^c
	ClipWait
	Sleep, 200
	SendInput, {Escape}
	file_path := Clipboard
	for index, elements in folders {
		folder := folders[index]
		folder := RegExReplace(folder, "\\|\/|\:|\*|\?|\:|""|\<|\>|\|", Replacement := "")
		FileCreateDir, %file_path%\%folder%
		if (dataset = "France") or (dataset = "Belgium") {
			FileCreateDir, %file_path%\%folder%\$Translated	
		}
	}
return

; Enter User Information: m + m
;
; Starting Position: First text box in form
;
; Fills in user information during the checkout process for filings purchasing.
; Checks the current dataset and sends different output to match the forms.
; 
; The function enter_info() is found in the file Valuation Pusher_Private to protect
; sensitive information.
;
enter_user_information:
::mm::
	enter_info(dataset)
return

; Enter Credit Card Information: c + c
;
; Starting Position: First text box in form
;
; Fills in credit card information during the checkout process for filings purchasing.
; Checks the current dataset and sends different output to match the forms.
;
; The function enter_cc() is found in the file Valuation Pusher_Private to protect
; sensitive information.
;
enter_cc_information:
::cc::
 	enter_cc(dataset)
return

;                                                     -----GENERAL LANGUAGE FUNCTIONS-----
; ###############################################################################################################################################

; Articles of Association: Control + Shift + 1
;
; Starting Position: Various text fields depending on dataset
;
; Prints dataset-specific language indicating "Articles of Association".
; The intention is to use this function for searching/filtering in various
; filing systems.
;
articles_of_association:
^+1::
	if (dataset = "Israel") {
		SendInput, {U+05EA}
		SendInput, {U+05E7}
		SendInput, {U+05E0}
		SendInput, {U+05D5}
		SendInput, {U+05DF}
		SendInput, {Space}
		SendInput, {U+05D5}
		SendInput, {U+05E9}
		SendInput, {U+05D9}
		SendInput, {U+05E0}
		SendInput, {U+05D5}
		SendInput, {U+05D9}
		SendInput, {Space}
		SendInput, {U+05EA}
		SendInput, {U+05E7}
		SendInput, {U+05E0}
		SendInput, {U+05D5}
		SendInput, {U+05DF}	
		SendInput, {Space}
		SendInput, {U+05D0}
		SendInput, {U+05D5}
		SendInput, {Space}
		SendInput, {U+05EA}
		SendInput, {U+05D6}
		SendInput, {U+05DB}
		SendInput, {U+05D9}
		SendInput, {U+05E8}
	}
return

; Change in Share Capital: Control + Shift + 2
;
; Starting Position: Various text fields depending on dataset
;
; Prints dataset-specific language indicating "Change in Share Capital".
; The intention is to use this function for searching/filtering in various
; filing systems.
;
change_in_share_capital:
^+2::
	if (dataset = "Israel") {
		SendInput, {U+05D4}
		SendInput, {U+05D5}
		SendInput, {U+05DF}
		SendInput, {Space}
		SendInput, {U+05D5}
		SendInput, {U+05DE}
		SendInput, {U+05E0}
		SendInput, {U+05D9}
		SendInput, {U+05D5}
		SendInput, {U+05EA}
	}
return

; Approval of Share Capital: Control + Shift + 3
;
; Starting Position: Various text fields depending on dataset
;
; Prints dataset-specific language indicating "Approval of Share Capital".
; The intention is to use this function for searching/filtering in various
; filing systems.
;
approval_of_share_capital:
^+3::
	if (dataset = "Israel") {
		SendInput, {U+05D0}
		SendInput, {U+05D9}
		SendInput, {U+05E9}
		SendInput, {U+05D5}
		SendInput, {U+05E8}
		SendInput, {Space}
		SendInput, {U+05D4}
		SendInput, {U+05D5}
		SendInput, {U+05DF}
		SendInput, {Space}
		SendInput, {U+05DE}
		SendInput, {U+05E0}
		SendInput, {U+05D9}
		SendInput, {U+05D5}
		SendInput, {U+05EA}
	}
return

; Stock Split: Control + Shift + 4
;
; Starting Position: Various text fields depending on dataset
;
; Prints dataset-specific language indicating "Stock Split".
; The intention is to use this function for searching/filtering in various
; filing systems.
;
stock_split_translation:
^+4::
	if (dataset = "Israel") {
		SendInput, {U+05DE}
		SendInput, {U+05D9}
		SendInput, {U+05D6}
		SendInput, {U+05D5}
		SendInput, {U+05D2}
		SendInput, {Space}
		SendInput, {U+05DE}
		SendInput, {U+05D4}
		SendInput, {U+05E1}
		SendInput, {U+05D1}
		SendInput, {U+05D4}
	}
return

; Share Allocation: Control + Shift + 5
;
; Starting Position: Various text fields depending on dataset
;
; Prints dataset-specific language indicating "Share Allocation".
; The intention is to use this function for searching/filtering in various
; filing systems.
;
share_allocation:
^+5::
	if (dataset = "Israel") {
		SendInput, {U+05D0}
		SendInput, {U+05D2}
		SendInput, {U+05E8}
		SendInput, {U+05D5}
		SendInput, {U+05EA}
		SendInput, {Space}
		SendInput, {U+05D5}
		SendInput, {U+05D4}
		SendInput, {U+05E0}
		SendInput, {U+05D4}
		SendInput, "
		SendInput, {U+05D7}
		SendInput, {Space}
		SendInput, {U+05DE}
		SendInput, {U+05D4}
		SendInput, {U+05E1}
		SendInput, {U+05D1}
		SendInput, {U+05D4}
	}
return

; Cap Table: Control + Shift + 6
;
; Starting Position: Various text fields depending on dataset
;
; Prints dataset-specific language indicating "Cap Table".
; The intention is to use this function for searching/filtering in various
; filing systems.
;
cap_table:
^+6::
	if (dataset = "Israel") {
		SendInput, {U+05D2}
		SendInput, {U+05E8}
		SendInput, {U+05D9}
		SendInput, {U+05E2}
		SendInput, {U+05EA}
		SendInput, {Space}
		SendInput, {U+05D7}
		SendInput, {U+05D1}
		SendInput, {U+05E8}
		SendInput, {U+05EA}
		SendInput, {Space}
		SendInput, {U+05D7}
		SendInput, {U+05D5}
		SendInput, {U+05E5}
		SendInput, {Space}
		SendInput, {U+05DE}
		SendInput, {U+05D4}
		SendInput, {U+05E1}
		SendInput, {U+05D1}
		SendInput, {U+05D4}
	}
return

; Translate Word: Control + Shift + t
;
; Starting position: A highlighted word or phrase
;
; Opens a browser window and translates the word using Google Translate.
; Language selection in Google Translate is based on the dataset selected.
;
translate_word:
^+t::
	Clipboard := ""
	SendInput, ^c
	ClipWait
	string := Clipboard
	string := StrReplace (string, " ", "%20%")
	if (dataset = "France") {
		language :=	"fr"	
	}
	if (dataset = "Germany") {
		language := "de"	
	}
	if (dataset = "Belgium") {
		language := "nl"	
	}
	if (dataset = "Switzerland") {
		language := "de"
	}
	if (dataset = "Israel") {
		language := "iw"		
	}
	if (dataset = "Finland") {
		language := "fi"
	}
	Run, https://translate.google.com/#view=home&op=translate&sl=%language%&tl=en&text=%string%
return