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
                                                                                                                                                


      :::    ::: :::::::::: :::        :::::::::  :::::::::: :::::::::          :::::::::: :::    ::: ::::    :::  :::::::: ::::::::::: ::::::::::: ::::::::  ::::    :::  :::::::: 
     :+:    :+: :+:        :+:        :+:    :+: :+:        :+:    :+:         :+:        :+:    :+: :+:+:   :+: :+:    :+:    :+:         :+:    :+:    :+: :+:+:   :+: :+:    :+: 
    +:+    +:+ +:+        +:+        +:+    +:+ +:+        +:+    +:+         +:+        +:+    +:+ :+:+:+  +:+ +:+           +:+         +:+    +:+    +:+ :+:+:+  +:+ +:+         
   +#++:++#++ +#++:++#   +#+        +#++:++#+  +#++:++#   +#++:++#:          :#::+::#   +#+    +:+ +#+ +:+ +#+ +#+           +#+         +#+    +#+    +:+ +#+ +:+ +#+ +#++:++#++   
  +#+    +#+ +#+        +#+        +#+        +#+        +#+    +#+         +#+        +#+    +#+ +#+  +#+#+# +#+           +#+         +#+    +#+    +#+ +#+  +#+#+#        +#+    
 #+#    #+# #+#        #+#        #+#        #+#        #+#    #+#         #+#        #+#    #+# #+#   #+#+# #+#    #+#    #+#         #+#    #+#    #+# #+#   #+#+# #+#    #+#     
###    ### ########## ########## ###        ########## ###    ###         ###         ########  ###    ####  ########     ###     ########### ########  ###    ####  ########       
                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                  
Created by Brian Hart @ all rights reserved
PitchBook Data Inc.
Fight Club Research Team
Please contact Brian.Hart@pitchbook.com to report any issues or update requests regarding this script or if you'd just like to talk. 
*/

; Accepts the two rows from the round information section of the
; Fight Club tool (string), maps the top row keys to the bottom
; row values and returns an associated array.
;
get_FC_round_info(table) {
	FC_round_info_raw := []
	FC_round_info_raw := StrSplit(table, A_Tab)
	
	temp_str := FC_round_info_raw[27]
	temp_array := []
	temp_array := StrSplit(temp_str, "`r`n")

	FC_round_info := {}
	Loop, 17 {
		FC_round_info[FC_round_info_raw[A_Index]] := FC_round_info_raw[A_Index + 17]
	}

	FC_round_info["Price per Share"] := FC_round_info["Post-Money Val"]
	FC_round_info["Pre-Money Val"] := temp_array[2]
	FC_round_info["Round Amount"] := temp_array[3]
	FC_round_info["Post-Money Val"] := temp_array[4]
	FC_round_info["% Acquired"] := temp_array[5]
	
	return FC_round_info
}

; Switchs from to Fight Club tool to the RTS Window
; of the same company that's being researched.
;
switch_to_RTS_window() {
	SendInput, {PgUp 3}
	SendInput, ^f
	Sleep, 200
	SendInput, Special Note
	SendInput, {Escape}
	Sleep, 200
	SendInput, ^f
	Sleep, 200
	SendInput, |
	Sleep, 200
	SendInput, {Tab}
	SendInput, {Enter}
	SendInput, {Escape}
	SendInput, ^+{Home}
	Clipboard := ""
	SendInput, ^c
	ClipWait
	comp_name := Clipboard
	window_name := "PitchBook RTS " . comp_name . "- Google Chrome"
	WinActivate, %window_name%
	refresh_RTS()
	return	
}

; Accepts an associated array containing round information from
; the Fight Club tool and opens the round details window in RTS
; indexing on the round date.
;
open_round_details(FC_round_info) {
	round_date := Trim(FC_round_info["Date"])
	SendInput, ^f
	Sleep, 200
	SendInput, %round_date%
	Sleep, 200
	SendInput, {Escape}
	SendInput, {Tab 7}
	SendInput, {Enter}
	Sleep, 200
	SendInput, #{Up}
	WinActivate,Round Details - Google Chrome
	Input, SingleKey, L1 {Enter}
	return
}

; Accepts the funding note from the round details window (string)
; and returns the funding use portion of the note (string).
;
get_funding_use(round_note) {
	round_note_array := []
	round_note_array := StrSplit(round_note, ". ")
	
	usage_str := round_note_array.Pop()
	usage_str_array := []
	usage_str_array := StrSplit(usage_str, " ")

	Loop % usage_str_array.Length() {
		test_str := usage_str_array[A_Index]
		test_str := Trim(test_str)
		if (test_str in use,used,uses,utilize,utilized,utilizes,enables,enable,enabled) {
			return usage_str
		}
	}
    return	
}

; Returns the external note in the Round Details window.
;
get_round_note() {
	if WinActive("Round Details - Google Chrome") {
		SendInput, ^f
		Sleep 200
		SendInput, external note:{space}
		Sleep 200
		SendInput, {Escape}
		SendInput, {Tab}
		Clipboard := ""
		SendInput, ^a
		SendInput, ^c
		ClipWait
		round_note := Clipboard
		funding_use := get_funding_use(round_note)
		SendInput, ^a
		SendInput, {BackSpace}
		SendInput, {Tab 2}
		SendInput, {Space}
		Sleep, 2000
		SendInput, +{Tab 2}
		SendInput, ^{End}
		SendInput, %funding_use%
		Clipboard := ""
		SendInput, ^a
		SendInput, ^c
		ClipWait
		round_note := Clipboard
		Input, SingleKey, L1 {Enter}
		SendInput, ^s
		SendInput, ^w
		return round_note
	}
}

; Accepts an array of information from the FC tool cap table
; header and checks if the round associated with that cap
; table is the last round of the company.
;
last_round(FC_round_info) {
	SendInput, {PgUp 3}
	SendInput, ^f
	Sleep 200
	SendInput, Rounds
	Sleep 200
	SendInput, {Enter}
	SendInput, {Escape}
	Sleep, 500
	SendInput, {Tab 2}
	rounds := []
	Clipboard := ""
	SendInput, ^c
	ClipWait
	rounds.Push(Clipboard)
	test_val := rounds[rounds.MaxIndex()]
	test_if_int := IsType(test_val, "integer")
	while (test_if_int = 1) {
		SendInput, {Tab 15}
		Clipboard := ""
		SendInput, ^c
		ClipWait
		rounds.Push(Clipboard)
		test_val := rounds[rounds.MaxIndex()]
		test_if_int := IsType(test_val, "integer")	
	} 			
	rounds.Pop()
	last_round := rounds.Pop()
	last_round += 0.0
	current_round := StrReplace(FC_round_info["`r`nRound #"], "`r`n")
	current_round := Trim(current_round)
	current_round += 0.0
	if (current_round == last_round) {
		return true
	} 
	else {
		return false
	}
}

; Accepts a string containing the external note from the Round Details
; window and prints it into the Financing Status Note on the Company
; tab.
;
add_finstat_note(round_note) {
	SendInput, {PgUp 3}
	MouseClick, Left, 680, 1025
	Input, SingleKey, L1 {Enter}
	SendInput, ^f
	Sleep 200
	SendInput, Financing Status Note:
	Sleep 200
	SendInput, {Escape}
	SendInput, {Tab 2}
	SendInput, ^a
	SendInput, {BackSpace}
	SendInput, %round_note%
	SendInput, ^s
}

; Refreshes RTS by moving the mouse to the Company Tab in the RTS
; header and clicking.
;
refresh_RTS() {
	MouseClick, Left, 295, 218
	Input, SingleKey, L1 {Enter}
	return
}

; Accepts a variable and type and checks if the provided variable is of the
; provided type.
;
IsType(p_Input, p_Type) {
	if InStr("integer,float,number,digit,xdigit,alpha,upper,lower,alnum,space,time",p_Type,false) {
		if (p_Input is %p_Type%) {
			return 1	
		} else {
			return 0
		}		
	} 
}

; Accepts a user input-defined dataset and returns a stardardized name for
; that dataset.
;
get_dataset_name(dataset) {
	if (dataset = "us") {
        return "United States"
    }
    if (dataset = "uk") {
        return "United Kingdom"
    } 
    if (dataset = "fr") {
        return "France"
    } 
    if (dataset = "g") {
        return "Germany"
    } 
    if (dataset = "b") {
        return "Belgium"
    } 
    if (dataset = "s") {
        return "Switzerland"
    } 
    if (dataset = "i") {
        return "Israel"
    }
    if (dataset = "fi") {
    	return "Finland"
    } 
}

act_log_notes(dataset, workflow) {
    SendInput, %dataset%{Space}
    if (workflow = "nr") {
        SendInput, New Round. ///
    }
    else if (workflow = "nc") {
        SendInput, New Company. ///
    }
    else if (workflow = "rr") {
        SendInput, Client Request. ////
    }  
}