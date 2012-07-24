
// saemon brynnlaw -> sahuagin city sequence errors (8 changes)
// see ppsaem3.dlg (x2), ppsailor.dlg, ar1600.bcs, cut41q.bcs, cut41zf.bcs, cut41zg.bcs, ppsaem2.bcs
// last brynnlaw dialogue; destroyself() to avoid ar1600 saemon talking instead of ar1617 one
ALTER_TRANS PPSAEM3 BEGIN 70 END BEGIN 0 END // filename, state, trans
BEGIN // list of changes, see below for flags
  ACTION ~GiveItemCreate("misc8u",LastTalkedToBy,0,0,0)
          StartCutSceneMode()
          StartCutScene("Cut41q")
          Wait(1) 
          DestroySelf()~
END

// saemon brynnlaw -> sahuagin city sequence errors (8 changes)
// see ppsaem3.dlg (x2), ppsailor.dlg, ar1600.bcs, cut41q.bcs, cut41zf.bcs, cut41zg.bcs, ppsaem2.bcs
// give Saemon a true() trigger during gith attack
ADD_STATE_TRIGGER PPSAEM3 59 ~Global("AsylumPlot","GLOBAL",81)~

// saemon brynnlaw -> sahuagin city sequence errors (8 changes)
// see ppsaem3.dlg (x2), ppsailor.dlg, ar1600.bcs, cut41q.bcs, cut41zf.bcs, cut41zg.bcs, ppsaem2.bcs
// if player talks to saemon during attack (saemon teleports away), then end dialogue here instead of handing to saemon
EXTEND_BOTTOM PPSAILOR 1
  IF ~Global("AsylumPlot","GLOBAL",200)~ THEN EXIT
END

// No valid replies or links for Cernd
ALTER_TRANS cernd BEGIN 6 END BEGIN 0 END BEGIN TRIGGER
~!Class(Player1,DRUID_ALL) !Class(Player1,RANGER_ALL) !InParty("Jaheira") !InParty("Minsc")~ END

// Romance interests can comment on PhaereInnuendo in chapter 6 if they were not in the party during chapter 5 (the bigg)
ADD_STATE_TRIGGER ~AERIEJ~ 119 ~Global("Chapter","GLOBAL",5)~ 124 126
ADD_STATE_TRIGGER ~JAHEIRAJ~ 437 ~Global("Chapter","GLOBAL",5)~ 441 447
ADD_STATE_TRIGGER ~VICONIJ~ 97 ~Global("Chapter","GLOBAL",5)~ 106 108

//You can ask Roger about the gong again and again; put an end to that (Wisp)
ADD_TRANS_TRIGGER roger 0 ~Global("flRogerGong","LOCALS",0)~ 1 DO 3
ADD_TRANS_TRIGGER roger 4 ~Global("flRogerGong","LOCALS",0)~ 7 24 27 DO 2
ADD_TRANS_TRIGGER roger 8 ~Global("flRogerGong","LOCALS",0)~ 9 DO 1
ADD_TRANS_ACTION roger BEGIN 12 END BEGIN 0 END ~SetGlobal("flRogerGong","LOCALS",1)~
