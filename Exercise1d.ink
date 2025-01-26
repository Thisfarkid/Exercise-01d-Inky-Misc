VAR time = -1
VAR outfit = ""


->start

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "early morning. The sun is rising and birds are chriping."
        
        - time == 1:
            ~ return "noon now."
        
        - time == 2:
            ~ return "night time. The sun has set."
    
    }
    
    
        
    ~ return time

==start==
It's {advance_time ()} ->bedroom

==bedroom==
You are in your room. {time==0: There's plenty to be done today.} {time==2:Its getting late. If you haven't gotten anything done yet, you probably should. } {not clean_room:Things are strewn about and it's pretty messy.} What do you want to do?

+{time==0}[Go to sleep] ->sleep
+{time==1}[Go to sleep] ->sleep1
+{time==2}[Go to sleep] ->sleep2
+{not clean_room}[Clean your room] ->clean_room
*{time==0} [Get ready for the day] ->Get_ready
*[Play some games] ->gaming
*{time==0} [Go to class] ->go_to_class
*{time==1} [Go to class] ->go_to_class
*[Do homework] ->homework
==gaming==
You decide to hop on your favorite game and get lost in it for a few hours making a lot of progress in it. 
*[Back]

==sleep==
Sleeping instead of being productive. Really? Lazy bum
->start

==sleep1==
Mid day nap? Cmon man, do something.
->start

==sleep2==
You fall into a dreamless sleep and awake the next day
->start


==clean_room==
You decide to pick up your room and organize. It looks a lot better now that its clean. 
*[back] ->bedroom

==Get_ready==
You go to your closet and pick out a set of clothes
*[Emo fit]
~outfit = "emo"
->bedroom
*[Skater boy]
~outfit = "skater"
->bedroom
*[Business casual]
~outfit = "fancy"
->bedroom

==homework==
{not go_to_class: The homework was difficult since you didnt go to class. It would've been easier if you did.}
{go_to_class: Since you went to class, the home work was fairly easy enough to do and you now have more time on your hands.}
*{go_to_class}[Back] ->bedroom

*{not go_to_class} [Back] ->start

==go_to_class==
You walk out your room and head to class. {Get_ready: On your way there you're able to talk to a friend and they comment on your {outfit} clothes. } After your talk you finish heading off to class and sit down at one of the desks. The class was pretty interesting and helped you understand the next assignment. You head back to your room after class is over 
*[Back]->bedroom
