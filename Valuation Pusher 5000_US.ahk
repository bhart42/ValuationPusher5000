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
                                                                                                                                                

				      
				      :::    :::  ::::::::          :::::::::: ::::::::: ::::::::::: ::::::::::: ::::::::::: ::::::::  ::::    ::: 
				     :+:    :+: :+:    :+:         :+:        :+:    :+:    :+:         :+:         :+:    :+:    :+: :+:+:   :+:  
				    +:+    +:+ +:+                +:+        +:+    +:+    +:+         +:+         +:+    +:+    +:+ :+:+:+  +:+   
				   +#+    +:+ +#++:++#++         +#++:++#   +#+    +:+    +#+         +#+         +#+    +#+    +:+ +#+ +:+ +#+    
				  +#+    +#+        +#+         +#+        +#+    +#+    +#+         +#+         +#+    +#+    +#+ +#+  +#+#+#     
				 #+#    #+# #+#    #+#         #+#        #+#    #+#    #+#         #+#         #+#    #+#    #+# #+#   #+#+#      
				 ########   ########          ########## ######### ###########     ###     ########### ########  ###    ####       
                                                                                                                                                 
Created by Austin White @ all rights reserved
PitchBook Data Inc.
Fight Club Research Team
Please contact Austin.White@pitchbook.com to report any issues or update requests regarding this script.
*/
;                                                      -----FIGHT CLUB TOOL FUNCTIONS-----
; ###############################################################################################################################################

; Amendment Template: a + m + e
;
; Starting Position: Fight Club Tool note section
;
; Prints a template in the Fight Club Tool note section for adding an 
; amendment filing.
;
amendment_template:
::ame::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ame = () Amendment: Common: Preferred: 
	}
return

; Original Template: o + r + i
;
; Startig Position: Fight Club Tool note section
;
; Prints a template in the Fight Club Tool note section for adding an 
; original filing. 
;
original_template:
::ori::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ori = () Original: Common: Preferred: 
	}
return

; Fully Dilute: c + v
; 
; Starting Position: Series shares authorized cell in the cap table
;
; Copies the shares from authorized and pastes them into outstanding, 
; thus making the shares fully diluted. Advances to the next series
; so that multiple series can be diluted in succession.
;
fully_dilute:
::cv::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^a
		SendInput, ^c
		SendInput, {Right 2}
		SendInput, ^a
		SendInput, ^v
		SendInput, {Down}
		SendInput, +{Tab}
		SendInput, {Left}
	}
return

; Add Pricing: s + f + 1
;
; Starting Position: Original Issue Price (OIP) cell in cap table with 
;                    OIP copied
;
; Pastes the price of a series into the  OIP, liquidation, and 
; conversion pricing cells in the cap table. Assumption is that the 
; prices are all the same.
; 
add_pricing:
::sf1:: 
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^v
		SendInput, {Tab}
		SendInput, ^v
		SendInput, {Tab}
		SendInput, ^v
	}
return

; Remove CSA: x + v
; 
; Starting Position: Common shares authorized cell in the cap table
;
; Cuts the the number of shares in the CSA cell and pastes them into 
; the notes section.
;
remove_csa:
::xv::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, ^a
		SendInput, ^x
		SendInput, +{Tab 3}
		SendInput, CSA:{Space}
		SendInput, ^v
	}
return

; Add CSA: k + j
;
; Starting Position: Fight Club Tool note section with CSA copied
; 
; Pastes the common shares authorized from the notes section into 
; the CSA cell in the cap table.
;
add_csa:
::kj::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, {Tab 3}
		SendInput, ^v
	}
return

; Amendment Tranching: qwer
; 
; Starting Position: Fight Club Tool note section
;
; Copies the filing date, filing ID, common shares authorized,
; preferred shares authorized, and the newest series authorized 
; and tranches it into the notes section.
;
amendment_tranching:
::qwer::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, +{Tab 4}
		SendInput, ^a
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		filing_date := Clipboard
		SendInput, {Tab}
		SendInput, ^a
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		doc_number := Clipboard
		SendInput, {Tab 6}
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		common := Clipboard
		SendInput, {Down}
		SendInput, ^a
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		preferred := Clipboard
		SendInput, ^f
		Sleep, 200
		SendInput, add 
		Sleep, 200
		SendInput, {Escape}
		SendInput, 	+{Tab 8} 
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		series_shares := Clipboard
		SendInput, ^f
		Sleep, 200
		SendInput, stock split
		Sleep, 200
		SendInput, {Tab}
		SendInput, {Enter}
		SendInput, {Escape}
		SendInput, +{Tab}
		SendInput, %filing_date% (%doc_number%) Amendment: Common: %common% Preferred: %preferred% Series __: %series_shares% 
	}
return

; Amendment Unwind: rewq
; 
; Starting Position: Fight Club Tool note section, line with the 
;                    Amendment note.
;
; Copies the information in the Amendment note and puts the
; corresponding elements in their respective cells in the cap table.
;
amendment_unwind:
::rewq::
	if WinActive("Fight Club - Google Chrome") {
		SendInput, {End}
		SendInput, ^+{Left}
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		series_shares := Clipboard
		SendInput, ^f
		Sleep, 200
		SendInput, preferred
		Sleep, 200
		SendInput, {Tab}
		SendInput, {Enter}
		SendInput, {Escape}
		SendInput, {Right 3}
		SendInput, ^+{Right}
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		preferred := Clipboard
		SendInput, ^f
		Sleep, 200
		SendInput, common
		Sleep, 200
		SendInput, {Tab}
		SendInput, {Enter}
		SendInput, {Escape}
		SendInput, {Right 3}
		SendInput, ^+{Right}
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		common := Clipboard
		SendInput, ^f
		Sleep, 200
		SendInput, amendment
		Sleep, 200
		SendInput, {Escape}
		SendInput, {Left 3}
		SendInput, ^+{Left}
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		doc_number := Clipboard
		SendInput, {Left 2}
		SendInput, ^+{Home}
		Sleep, 500
		Clipboard := ""
		SendInput, ^x
		ClipWait, 0
		if ErrorLevel {
			Clipboard := "???"
		}
		filing_date := Clipboard
		SendInput, +{End}
		SendInput, {Delete}
		SendInput, +{Tab 3}
		SendInput, %doc_number%
		SendInput, +{Tab}
		SendInput, %filing_date%
		SendInput, {Tab 7}
		SendInput, %common%
		SendInput, {Down}
		SendInput, %preferred%
		SendInput, ^f
		Sleep, 200
		SendInput, add 
		Sleep, 200
		SendInput, {Escape}
		SendInput, 	+{Tab 8}
		SendInput, %series_shares%
	}
return

; Past Common: p + c + 1
;
; Starting Position: Common shares authorized cell of cap table 
;                    immediately preceding the cap table to be pushed.
;
; Calculates the Past Common method and pastes the final value in 
; the new cap table notes section.
;
; Note: This hotkey only works if the cap tables are right next to 
; each other (i.e. no debt/grant/accelerator/etc. round separating 
; the two cap tables)
;
past_common:
::pc1::
	if WinActive("Fight Club - Google Chrome") {
		clipboard := ""
		Sendinput, ^a
		Sendinput, ^c
		ClipWait
		pcsa := clipboard
		pcsa := Strreplace(pcsa, ",")
		SendInput, +{tab 17}
		clipboard := ""
		Sendinput, ^c
		ClipWait
		sso := clipboard
		sso := strreplace(sso,",") 
		Sendinput, ^f
		Sleep, 200
		Sendinput, stock split
		Sleep, 200
		Sendinput, {tab}
		Sendinput, {Enter}
		Sendinput, {Escape}
		Sleep, 200
		Sendinput, +{tab}
		Sendinput, {Enter}
		pc := pcsa + sso 
		Sendinput, PC 
		Sendinput, {Space}%pc%
	}
return
	
; Adjusted Past Common: apc1
; 
; Starting Position: New cap table preferred shares authorized cell in
;                    cap table.
; 
; Calculates the Adjusted Past Common method and places the final 
; value in the new cap table notes section.
;
; Note: This hotkey only works if the cap tables are right next to 
; each other (i.e. no debt/grant/accelerator/etc. round separating 
; the two cap tables)
;
adjusted_past_common:
::apc1::
	if WinActive("Fight Club - Google Chrome") {
		clipboard := ""
		Sendinput, ^a
		Sendinput, ^c
		ClipWait
		psa1 := clipboard
		psa1 := Strreplace(psa1, ",")	
		SendInput, ^f
		Sleep, 200
		SendInput, add
		Sleep, 200
		SendInput, {Escape}
		Sendinput, +{Tab 8}
		clipboard := ""
		Sendinput, ^c
		ClipWait
		nsa := clipboard
		nsa := Strreplace(nsa, ",")
		SendInput, ^f
		Sleep, 200
		SendInput, split
		Sleep, 200
		SendInput, {Escape}
		SendInput, {Tab 4} 
		SendInput, {Down}
		clipboard := ""
		SendInput, ^a
		Sendinput, ^c
		ClipWait
		ppo := clipboard
		ppo := Strreplace(ppo, ",")
		SendInput, {Up}
		clipboard := ""
		SendInput, ^a
		Sendinput, ^c
		ClipWait
		pcso := clipboard
		pcso := Strreplace(pcso, ",")
		SendInput, +{Tab 18}
		clipboard := ""
		Sendinput, ^c
		ClipWait
		nso := clipboard
		nso := Strreplace(nso, ",")
		Sendinput, ^f
		Sleep, 200
		Sendinput, stock split
		Sleep, 200
		Sendinput, {tab}
		Sendinput, {Enter}
		Sendinput, {Escape}
		Sleep, 500
		Sendinput, +{tab}
		fin := psa1 - nsa - ppo + pcso + nso
		Sendinput, {Enter}
		SendInput, APC
		SendInput, {Space}%fin%
	}
return

; First Round: f + r + 1
;
; Starting Position: Common shares authorized cell of cap table 
;                    immediately preceding the cap table to be pushed.
;
; Calculates the First Round method and pastes the final value in the
; past cap table notes section
;
; Note: This hotkey only works if the cap tables are right next to 
; each other (i.e. no debt/grant/accelerator/etc. round separating 
; the two cap tables)
;
first_round:
::fr1::
	if WinActive("Fight Club - Google Chrome") {
		clipboard := ""
		Sendinput, ^a
		Sendinput, ^c
		ClipWait
		cso := Clipboard
		cso := StrReplace(cso, ",")
		SendInput, {Down}
		Clipboard := ""
		Sendinput, ^a
		SendInput, ^c 
		ClipWait
		pso := Clipboard
		pso := StrReplace(pso, ",")
		SendInput, ^f
		Sleep, 200
		SendInput, split
		Sleep, 200
		SendInput, {Escape}
		SendInput, {Tab 4} 
		SendInput, {Down}
		Clipboard := ""
		SendInput, ^a
		SendInput, ^c
		Clipwait
		ppso := Clipboard
		ppso := StrReplace(ppso, ",")
		SendInput, {Up}
		SendInput, +{Tab 4}
		fr := cso - pso + ppso
		SendInput, {Enter}
		SendInput, FR 
		SendInput, {Space}%fr%
	}
return

; Dummy Series: r + f
; 
; Starting Position: Top of two series shares authorized cells of cap table. 
;                    Requires a blank dummy series below.
;
; Calculates the sum between two share classes' authorized and outstanding 
; shares and pastes it into the dummy series' authorized and outstanding cells.
; Calculates weighted average pricing and adds it to the cap table.
;
dummy_series:
::rf::
	if WinActive("Fight Club - Google Chrome") {
		Loop, 2 {
			Sendinput, ^a
			Clipboard := ""
			Sendinput, ^c
			ClipWait
			auth%A_index% := strreplace(Clipboard, ",")
			Sendinput, {Tab}
			Sendinput, ^a
			Clipboard := ""
			Sendinput, ^c
			ClipWait
			out%A_index% := strreplace(Clipboard, ",")
			SendInput, {Tab 4}
			Sendinput, ^a
			Clipboard := ""
			Sendinput, ^c
			ClipWait
			OIP%A_index% := strreplace(Clipboard, ",")
			SendInput, {Tab 4}	
		}
		dummy_auth := auth1 + auth2
		dummy_out := out1 + out2
		Sendinput, %dummy_auth%
		SendInput, {Tab}
		Sendinput, %dummy_out%
		SendInput, {Tab 4}
		dummy_OIP := ((out1 * OIP1) + (out2 * OIP2)) / dummy_out
		Loop, 3 {
			SendInput, %dummy_OIP%
			SendInput, {Tab}	
		}
	}
return 