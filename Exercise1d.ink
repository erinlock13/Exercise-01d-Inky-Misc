/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR time = -1 //  0 Morning, 1 Noon, 2 Night
VAR color = ""
~ color ="{~red|blue|green|pink|white}"

-> seashore

== seashore ==
You are sitting on the beach. 
It is { advance_time() }.
{&The waves crash gently.|The sand is soft between your toes.|The sky is clear.}
+ [Wait] -> seashore
+ [Walk down the beach] -> beach2
+ {time == 2}[Look for shells] -> seashells

== beach2 ==
This is further down the beach.
It is { advance_time() }.
+ [Wait] -> beach2
+ [Move back up the beach] -> seashore
+ {time == 0}[Inspect cave?] -> cave_outside 
+ {time == 1}[Look for sea glass] -> seaglass
== shells ==
You pick up the shells
-> beach2

== seashells ==
You find a pretty {color} shell!
->seashore

== seaglass ==
You find some {color} sea glass!
->beach2

== cave_outside ==
{ advance_time() }
You walk up to a cave enterence now visable due to the low tide. 
+[Go back] -> beach2
+[Go inside] -> cave

== cave ==
You stand in the cave. {not torch_pickup:There is a torch on the wall.} There are two paths. Wait, have you been here before?
+[Go west] ->west
+[Go east] ->east
*[Pick up the torch] ->torch_pickup

== west ==
You are in the west part of the cave.
+[Go back] ->cave

== east ==
You are in the east part of the cave. 
+[Go back] ->cave

== torch_pickup ==
You now have a torch!
+[Go back] ->cave

== function advance_time ==

    ~ time = time + 1
    {
        - time > 2:
            ~ time = 0
    }    
    {    
        - time == 0:
            ~ return "morning"
        
        - time == 1:
            ~ return "noon"
        
        - time == 2:
            ~ return "night"
    }
    ~ return time
    
    
    
