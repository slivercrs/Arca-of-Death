; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional -- defaults to 15 if omitted)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas.
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   You can combine them:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;   It's recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This matches the way most
;   popular fighting games implement their command detection.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. Defaults to 15
;   if omitted
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
; 
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10
; 

;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 30

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1


;-| AI |------------------------------------------------------------------------
[Command]
name = "CPU1"
command = U, D, F, U, D, F
time = 0

[Command]
name = "CPU2"
command = U, B, F, U, D, F
time = 0

[Command]
name = "CPU3"
command = U, D, D, U, D, F
time = 0

[Command]
name = "CPU4"
command = U, F, U, B, U, D, F
time = 0

[Command]
name = "CPU5"
command = B, B, B, U, B, U, D, F
time = 0

[Command]
name = "CPU6"
command = U, D, B, U, B, U, D, F
time = 0

[Command]
name = "CPU7"
command = F, F, B, U, B, U, D, F
time = 0

[Command]
name = "CPU8"
command = U, D, U, U, B, U, D, F
time = 0

[Command]
name = "CPU9"
command = F, B, B, U, B, U, D, F
time = 0

[Command]
name = "CPU10"
command = F, F, B, B, U, B, U, D, F
time = 0
;-| Super Motions |--------------------------------------------------------
[Command]
name = "Super Sword Combo"
command = D, DF, F, x+y
time = 30

[Command]
name = "Meteor Staff"
command = D, DF, F, a+b
time = 30

[Command]
name = "Bubble Gun"
command = D, DB, B, x+y
time = 30

[Command]
name = "Betsy's Wrath"
command = D, DB, B, a+b
time = 30
;-| Special Motions |------------------------------------------------------

[Command]
name = "MegaShark"
command = D, DF, F, a
time = 30

[Command]
name = "Proximity Mine Launcher"
command = D, DF, F, b
time = 30

[Command]
name = "Magical Harp"
command = D, DF, F, x
time = 30

[Command]
name = "Cursed Flame Book"
command = D, DF, F, y
time = 30

[Command]
name = "Nimbus Rod"
command = D, DB, B, x
time = 30

[Command]
name = "Possesed Axe"
command = D, DB, B, y
time = 30

[Command]
name = "Rod of Discord"
command = D, DB, B, a
time = 30

[Command]
name = "Death Sickle"
command = D, DB, B, b
time = 30

[Command]
name = "Super Jump"     ;Required (do not remove)
command = ~D, U
time = 10

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery" ;Required (do not remove)
command = x+y
time = 1

[Command]
name = "recovery"
command = y+z
time = 1

[Command]
name = "recovery"
command = x+z
time = 1

[Command]
name = "recovery"
command = a+b
time = 1

[Command]
name = "recovery"
command = b+c
time = 1

[Command]
name = "recovery"
command = a+c
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "back_x"
command = /$B,x
time = 1

[Command]
name = "back_y"
command = /$B,y
time = 1

[Command]
name = "back_z"
command = /$B,z
time = 1

[Command]
name = "down_x"
command = /$D,x
time = 1

[Command]
name = "down_y"
command = /$D,y
time = 1

[Command]
name = "down_z"
command = /$D,z
time = 1

[Command]
name = "fwd_x"
command = /$F,x
time = 1

[Command]
name = "fwd_y"
command = /$F,y
time = 1

[Command]
name = "fwd_z"
command = /$F,z
time = 1

[Command]
name = "up_x"
command = /$U,x
time = 1

[Command]
name = "up_y"
command = /$U,y
time = 1

[Command]
name = "up_z"
command = /$U,z
time = 1

[Command]
name = "back_a"
command = /$B,a
time = 1

[Command]
name = "back_b"
command = /$B,b
time = 1

[Command]
name = "back_c"
command = /$B,c
time = 1

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

[Command]
name = "down_c"
command = /$D,c
time = 1

[Command]
name = "fwd_a"
command = /$F,a
time = 1

[Command]
name = "fwd_b"
command = /$F,b
time = 1

[Command]
name = "fwd_c"
command = /$F,c
time = 1

[Command]
name = "up_a"
command = /$U,a
time = 1

[Command]
name = "up_b"
command = /$U,b
time = 1

[Command]
name = "up_c"
command = /$U,c
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "s"
command = s
time = 1

;-| Single Dir |------------------------------------------------------------
[Command]
name = "fwd" ;Required (do not remove)
command = $F
time = 1

[Command]
name = "downfwd"
command = $DF
time = 1

[Command]
name = "down" ;Required (do not remove)
command = $D
time = 1

[Command]
name = "downback"
command = $DB
time = 1

[Command]
name = "back" ;Required (do not remove)
command = $B
time = 1

[Command]
name = "upback"
command = $UB
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1

[Command]
name = "upfwd"
command = $UF
time = 1

;-| Hold Button |--------------------------------------------------------------
[Command]
name = "hold_x"
command = /x
time = 1

[Command]
name = "hold_y"
command = /y
time = 1

[Command]
name = "hold_z"
command = /z
time = 1

[Command]
name = "hold_a"
command = /a
time = 1

[Command]
name = "hold_b"
command = /b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1

[Command]
name = "hold_s"
command = /s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd" ;Required (do not remove)
command = /$F
time = 1

[Command]
name = "holddownfwd"
command = /$DF
time = 1

[Command]
name = "holddown" ;Required (do not remove)
command = /$D
time = 1

[Command]
name = "holddownback"
command = /$DB
time = 1

[Command]
name = "holdback" ;Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdupback"
command = /$UB
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holdupfwd"
command = /$UF
time = 1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.  
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]

;===========================================================================
;---------------------------------------------------------------------------
;===========================================================================
[State -1, AI ON] ; Turn the AI on when
Type = VarSet
TriggerAll = Var(59) < 1; it is not on yet and
TriggerAll = RoundState=2 ; the fight has started and is not over yet and
Trigger1 = AILevel>0 ; the computer is playing the character
v = 59
value= 1 ; value of 1 will mean the AI is on
Ignorehitpause=1

[State -1, AI OFF] ; Turn the AI off when
Type=VarSet
Trigger1=var(59)>0 ; it is on and
Trigger1=RoundState!=2 ; the round is not started yet or is already over
Trigger2=!IsHelper ; OR if we are a player, but
Trigger2=AILevel=0 ; the computer is not in control
v=59
value=0 ; value of 0 will mean the AI is off. values other than 0 and 1 are not used in this example, we have only one AI mode, the normal one.
Ignorehitpause=1

[State -1]
Type=VarSet
Trigger1=1
var(50)=(AILevel=1)*3+(AILevel=2)*7+(AILevel=3)*16+(AILevel=4)*30+(AILevel=5)*58+(AILevel=6)*90+ (AILevel=7)*150+(AILevel=8)*300

;---------------------------------------------------------------------------
; AI switch -> ON
[State -1, Activate AI]
type = Varset
triggerall = var(59) != 1
trigger1 = command = "CPU1"
trigger2 = command = "CPU2"
trigger3 = command = "CPU3"
trigger4 = command = "CPU4"
trigger5 = command = "CPU5"
trigger6 = command = "CPU6"
trigger7 = command = "CPU7"
trigger8 = command = "CPU8"
trigger9 = command = "CPU9"
trigger10 = command = "CPU10"
v = 59
value = 1

;===========================================================================
;--|-AI Defense-|-----------------------------------------------------------
   [State -1, AI Guarding, Easy/Medium AI]
   type = ChangeState
   triggerall = (roundstate = 2) && (var(59) != 0)
   triggerall = AILevel <=5
   triggerall = (Ctrl) && (p2movetype = A) && (statetype = S)
   trigger1 = (p2bodydist x <= 250) && (random = [200,899]) && (vel x < 0)
   trigger2 = (p2bodydist x <= 250) && (random = [800,899]) && (vel x > 0)
   trigger3 = (p2bodydist x <= 250) && (random = [400,899]) && (vel x = 0)
   trigger4 = (anim = 21)
   trigger5 = (prevstateno > 5000) && (random < 200)
   value = 130
   [State -1, AI Guarding, Easy/Medium AI]
   type = ChangeState
   triggerall = (roundstate = 2) && (var(59) != 0)
   triggerall = AILevel <=5
   triggerall = (Ctrl) && (p2movetype = A) && (statetype = C)
   trigger1 = (p2bodydist x <= 250) && (random = [500,899])
   trigger2 = (prevstateno > 5000) && (random < 200)
   value = 131
   [State -1, AI Guarding, Easy/Medium AI]
   type = ChangeState
   triggerall = (roundstate = 2) && (var(59) != 0)
   triggerall = AILevel <=5
   triggerall = (Ctrl) && (p2movetype = A) && (statetype = A)
   trigger1 = (p2bodydist x <= 250) && (random = [700,899])
   trigger2 = (anim = 43) || (anim = 46)
   trigger3 = (prevstateno > 5000) && (random < 200)
   value = 132
   [State -1, AI Guarding, Hard AI]
   type = ChangeState
   triggerall = (var(59) != 0) && Numenemy && (stateno != [120,155])
   triggerall = AILevel > 5
   triggerall = Random <= (AILevel * 10)
   triggerall =!(enemynear,hitdefattr=SCA,AT)
   triggerall = inguarddist
   trigger1 = ctrl
   value = 120
;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.

[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499])
trigger2 = stateno != 440 ;Except for slide
trigger2 = movecontact
var(1) = 1
;===========================================================================
;Combo #1
[State -1,AI Combo Attack]
type = ChangeState
value = 100
trigger1 = RoundState = 2 && Var(59) != 0
trigger1 = Ctrl && statetype = S
trigger1 = (P2BodyDist X = [0,500]) && (Random  = [0,100])
trigger1 = p2statetype != C

;Combo #2
[State -1,AI Crouching Light Kick]
type = ChangeState
value = 400
trigger1 = RoundState = 2 && Var(59) != 0
trigger1 = Ctrl && StateType = S
trigger1 = Random <= 100
trigger1 = (P2BodyDist X = [0,100])
;--------------------------------------------------------------------------------
[State -1, Artificial Intelligence]
type = ChangeState
triggerall = numhelper(741) = 0
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (random = [50,135])
trigger1 = (p2bodydist X <= 250) && (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 740

[State -1, Artificial Intelligence]
type = ChangeState
triggerall = numhelper(701) = 0
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (random = [50,135])
trigger1 = (p2bodydist X <= 270) && (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 700

[State -1, Artificial Intelligence]
type = ChangeState
triggerall = numhelper(721) = 0
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (random = [50,135])
trigger1 = (p2bodydist X <= 270) && (prevstateno != 5120) && (p2movetype != H) && (statetype != A)
value = 720
;===========================================================================

[State -1, Artificial Intelligence]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (p2statetype != L)
trigger1 = (prevstateno != 5120) && (numproj = 0) && (statetype != A)
trigger1 = (power > 1000) && (random = [0,300]) && (statetype != A)
value = 1000

[State -1, Artificial Intelligence]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (p2statetype != L)
trigger1 = (prevstateno != 5120) && (numproj = 0) && (statetype != A)
trigger1 = (power > 1500) && (random = [0,300]) && (statetype != A)
value = 1100

[State -1, Artificial Intelligence]
type = ChangeState
triggerall = (roundstate = 2) && (var(59) != 0)
triggerall = (Ctrl) && (Statetype = S) && (p2statetype != L)
trigger1 = (prevstateno != 5120) && (numproj = 0) && (statetype != A)
trigger1 = (power > 1000) && (random = [0,300]) && (statetype != A)
value = 1200
;===========================================================================
;---------------------------------------------------------------------------
[State -1, Super Jump]
type = ChangeState
value = 790
trigger1 = Command = "Super Jump"
trigger1 = ctrl && statetype != A
;---------------------------------------------------------------------------
; Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 99
trigger1 = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Run Back
[State -1, Run Back]
type = ChangeState
value = 105
trigger1 = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Throw
[State -1, Throw]
type = ChangeState
value = 800
triggerall = command = "y"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 10
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H
trigger2 = command = "holdback"
trigger2 = p2bodydist X < 10
trigger2 = (p2statetype = S) || (p2statetype = C)
trigger2 = p2movetype != H

;===========================================================================
;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "s"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Betsy's Wrath
[State -1, Betsy's Wrath]
type = ChangeState
value = 1300
triggerall = command = "Betsy's Wrath"
triggerall = power>=2000
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl
;---------------------------------------------------------------------------
;Bubble Gun
[State -1, Bubble Gun]
type = ChangeState
value = 1200
triggerall = command = "Bubble Gun"
triggerall = power>=1000
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl
;---------------------------------------------------------------------------
;Meteor Staff
[State -1, Meteor Staff]
type = ChangeState
value = 1100
triggerall = command = "Meteor Staff"
triggerall = power>=1500
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl
;---------------------------------------------------------------------------
;Super Sword Combo
[State -1, Super Sword Combo]
type = ChangeState
value = 1000
triggerall = command = "Super Sword Combo"
triggerall = power>=1000
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl
;---------------------------------------------------------------------------
;Proximity Mine Launcher
[State -1, Proximity Mine Launcher]
type = ChangeState
value = 770
triggerall = NumHelper(771) = 0
triggerall = command = "Proximity Mine Launcher"
triggerall = power>=250
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl
;---------------------------------------------------------------------------
;Rod of Discord
[State -1, Rod of Discord]
type = ChangeState
value = 760
triggerall = command = "Rod of Discord"
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl
;---------------------------------------------------------------------------
;Nimbus Rod
[State -1, Nimbus Rod]
type = ChangeState
value = 750
triggerall = command = "Nimbus Rod"
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl

;---------------------------------------------------------------------------
;Death Sickle
[State -1, Death Sickle]
type = ChangeState
value = 740
triggerall = NumHelper(741) = 0
triggerall = command = "Death Sickle"
triggerall = power>=250
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl

;---------------------------------------------------------------------------
;MegaShark
[State -1, MegaShark]
type = ChangeState
value = 730
triggerall = command = "MegaShark"&&(power>0)
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl

;---------------------------------------------------------------------------
;Possesed Axe
[State -1, Possesed Axe]
type = ChangeState
value = 720
triggerall = NumHelper(721) = 0
triggerall = command = "Possesed Axe"
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Possesed Axe (Air)
[State -1, Possesed Axe (Air)]
type = ChangeState
value = 723
triggerall = NumHelper(721) = 0
triggerall = command = "Possesed Axe"
triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Cursed Flame Book
[State -1, Cursed Flame Book]
type = ChangeState
value = 710
triggerall = NumHelper(711) = 0
triggerall = command = "Cursed Flame Book"
trigger1 = (statetype = S) && ctrl
trigger1 = ctrl

;---------------------------------------------------------------------------
;Magical Harp (Air)
[State -1, Magical Harp (Air)]
type = ChangeState
value = 705
triggerall = NumHelper(701) = 0
triggerall = command = "Magical Harp"
triggerall = statetype = A
trigger1 = ctrl
;---------------------------------------------------------------------------
;Magical Harp
[State -1, Magical Harp]
type = ChangeState
value = 700
triggerall = NumHelper(701) = 0
triggerall = command = "Magical Harp"
triggerall = statetype != A
trigger1 = ctrl
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
;---------------------------------------------------------------------------
; Stand Light Punch 2
[State -1, Stand Light Punch2]
type = ChangeState
value = 201
triggerall = command = "x"
triggerall = stateno = 200
trigger1 = time >= 6
trigger2 = movecontact
;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger3 = stateno = 201
trigger3 = movecontact
trigger4 = stateno = 400
trigger4 = movecontact
trigger5 = stateno = 430
trigger5 = movecontact
;---------------------------------------------------------------------------
; Stand Medium Punch 2
[State -1, Stand Medium Punch 2]
type = ChangeState
value = 211
triggerall = command = "y"
triggerall = stateno = 210
trigger1 = time >= 6
trigger2 = movecontact
;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 230
triggerall = command = "a"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl

;---------------------------------------------------------------------------
; Standing Medium Kick
[State -1, Standing Medium Kick]
type = ChangeState
value = 240
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger3 = stateno = 201
trigger3 = movecontact
trigger4 = stateno = 230
trigger4 = movecontact
trigger5 = stateno = 400
trigger5 = movecontact
trigger6 = stateno = 430
trigger6 = movecontact
;---------------------------------------------------------------------------
; Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Medium Punch
[State -1, Crouching Medium Punch]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = command = "holddown"
trigger2 = movecontact
trigger3 = stateno = 201
trigger3 = command = "holddown"
trigger3 = movecontact
trigger4 = stateno = 210
trigger4 = movecontact
trigger5 = stateno = 230
trigger5 = movecontact
;---------------------------------------------------------------------------
; Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall = command = "a"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouching Medium Kick
[State -1, Crouching Medium Kick]
type = ChangeState
value = 440
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger3 = stateno = 201
trigger3 = movecontact
trigger4 = stateno = 210
trigger4 = movecontact
trigger5 = stateno = 230
trigger5 = movecontact
trigger6 = stateno = 240
trigger6 = movecontact
;---------------------------------------------------------------------------
; Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
; Jump Medium Punch
[State -1, Jump Medium Punch]
type = ChangeState
value = 610
triggerall = command = "y"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
;---------------------------------------------------------------------------
; Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = command = "a"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact

;---------------------------------------------------------------------------
; Jump Medium Kick
[State -1, Jump Medium Kick]
type = ChangeState
value = 640
triggerall = command = "b"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 630
trigger2 = movecontact
;---------------------------------------------------------------------------
