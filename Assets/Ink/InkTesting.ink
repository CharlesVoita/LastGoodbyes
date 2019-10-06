VAR remembers_angela = false
VAR synthia_adult = false
VAR remembers_lydia = false
VAR remembers_lydia_before = false

-> start_convo

=== start_convo ===
- Hello James.
* [Continue]
- Look at that. A talking deer. I must be hallucinating. My brain is giving way.#James
* [Continue]
- You're not hallucinating. You've succumbed. I'm your guide to the other side. 
* [Continue]
- This is the final leap. All must end where all have started.##GrabBench
* [Continue]
- Gripping that bench won't keep you from the inevitable.

* But Synthia's birthday is next week.[] I need to get her flowers.#James
    * * [Continue]
    - - ... I need to talk to her.#James
    * * [Continue]
    - - Don't worry James. This is a place of closure. You will have a chance to have your last piece with the important people in your life.
    // * * [Continue]
    // - - But we don't have much time. You will only have the chance to have closure with 3 relationships.
    * * [Continue]
    - - Remember, asking the right questions might help you remember other key people that had touched you in your life.
    * * [Continue]
    ->convo_select
-> DONE

=== convo_select ===
- In which relationship would you like to seek closure?
* {remembers_lydia_before}[1977 - Lydia (Before)]
->lydia_before
* {remembers_lydia}[1979 - Lydia]
->lydia_after
* [1996 - Synthia at age 7]
->synthia_age_7
* {synthia_adult}[2008 - Synthia at age 19]
->synthia_age_19
* [2009 - Angela]
->angela
* [2003 - Bob]
->bob
*I'm ready to leap.
- - ##EndGame
->DONE



=== synthia_age_7 ===
- Synthia!#James#SynthiaYoung
~ synthia_adult = true
* [Continue]
- What daddy? Why are you so excited!?#Synthia
* [Continue]
- ...#James
-> synthia_age_7_q
-> DONE


=== synthia_age_7_q ===

* Have you found any snails lately?[] Has the rain brought them out recently?#James
* *[Continue]
    - - There was a real big one attached to the fountain, and she had a family! The cutest little mom!#Synthia
    * *  Oh yeah? Why do you think they were there?#James
    * * * [Continue]
    - - - They were thirsy daddy, duh!#Synthia
    - - - ->synthia_age_7_q
    * *  The cutest little mom? []You look just like your mom's twin.#James
    * * *[Continue]
    - - - Mom is so pretty! Thank you daddy, but we're not sisters.#Synthia
    * * *[Continue]
    - - - ->synthia_age_7_q
* How was school today?#James
    * *[Continue]
    - - It was good, we read The Giving Tree#Synthia
    - - -> synthia_age_7_q
* [Speak to others.]
    - - ->convo_select
->convo_select
->DONE

=== synthia_age_19 ===
- You grew up to be so damn strong.#James#SynthiaAdult
* [Continue]
- Okay, dad. Why so sentimental?#Synthia
-> synthia_age_19_q

=== synthia_age_19_q ===
* Are you still collecting snails?[] Are you still doing that?#James
* *[Continue]
    - - Eww, gross dad. No. But I still have Speedy! He's still around.#Synthia
    * * [Continue]
    - - Oh, right. Your plushy.#James
    * * [Continue]
->convo_select
->DONE


=== lydia_before ===
- ...##LydiaBefore
* [Continue]
- ...
* [Continue]
- What's up James? Why are you shaking?#James
* [Continue]
- ...
* [Continue]
- I just want to hold you.#James
* [Continue]
- Of course, baby.#Lydia#HoldLydia
* [Continue]
- ##EndGame
-> DONE

=== lydia_after ===
- ...Lydia?#James#LydiaAfter
* [Continue]
- What do you want to say now James!? Haven't you already said enough!?#Lydia
* * [Let her have it]
- - - How could have you done this to me, Lydia!?#James
* * *[Continue]
- - - After all our plans? After All our promises?#James
* * *[Continue]
- - - How many times do we have to go over this James!? It's over, It's done.#Lydia
* * *[Continue]
->convo_select
* * [Collect yourself]
- - - ...
* * * [Continue]
- - - ...
* * * [Continue]
- - - Nothing. I just miss you. That's all.#James
* * * [Continue]
- - - Oh...#Lydia
~ remembers_lydia_before = true
* * * [Continue]
- - - ->convo_select
-> DONE


=== angela ===
- Angela...#James#Angela
* [Continue]
-> angela_q


=== angela_q ===
* You are a great mom[]. I mean that. We didn't always get along but you were a fantastic mom.#James
    * *[Continue]
    - - Yeah, well we had to do what we had to for Synthia.#Angela
    - - ->angela_q
* The start of our marriage was rough, sorry.#James
    * *[Continue]
- - Well, with me getting pregnant and how our families reacted. What did we expect?#Angela
* *[Continue]
- - Plus you clearly never did get over Lydia. It all just happened so fast.#Angela
~ remembers_lydia = true
* *[Continue]
- - I still regret not biting my tongue with Lydia that night...#James
* *[Continue]
- - And why are you telling me this?#Angela
- - ->angela_q
* She turned out great, didn't she?
    * *[Continue]
- - Yeah, Synthia has quite a personality, doesn't she.#Angela
* *[Continue]
- - Remember how she used to collect those snails?#James
* *[Continue]
- - She's got your eyes.#Angela
* *[Continue]
- - And everything else from you! Where do you think that independence streak comes from?#James
- - ->angela_q
* You weren't the easiest to get along with.#James
    * *[Continue]
- - Ha! You were no cake walk either. We had to make it work for Synthia.#Angela
* *[Continue]
- - But all those fights. We were doomed before we started. I'm sorry.#James
* *[Continue]
- - We never wanted to start, James! I got pregnant!#Angela
- - ->angela_q
* [Speak to others.]
    - - ->convo_select
->convo_select
->DONE


=== bob ===
- Bob, it's good to see you again!#James#Bob
* [Continue]
- It's always good to see you too, James.#Bob
-> bob_q

=== bob_q ===
* Tim Reiker is a real paper pusher, isn't he?#James
* *[Continue]
    - - Damn straight. Salary is nice way to say unlimited overtime.#Bob
    * *  Do you have any head pain?#James
    * * * [Continue]
    - - - What, no. What are you talking about?#Bob
    * * * They just left you on the desk[] like that. They pushed you too hard. The aneurysim.#James
    * * * * [Continue]
    - - - - You okay, James?#Bob
    - - - - ->bob_q
    * *  He was a punk in school too. [] No surprise.#James
    * * *[Continue]
    - - - Well he got daddy's business. Had math with him. He wasn't that sharp#Bob
    * * *[Continue]
    - - - ->bob_q
* How's the family?#James
    * *[Continue]
    - - Rachel is good. She's had her hands full with Bobby Jr. though.#Bob
    * * [Continue]
    - - Damn, it's just so good to see you Bob.#James
    * * [Continue]
    - - -> bob_q
* [Speak to others.]
    - - ->convo_select
->convo_select
->DONE


=== Og_Test ===
- I looked at Monsieur Fogg 
*	... and I could contain myself no longer.
	'What is the purpose of our journey, Monsieur?'
	'A wager,' he replied.
	* * 	'A wager!'[] I returned.
			He nodded. 
			* * * 	'But surely that is foolishness!'
			* * *  'A most serious matter then!'
			- - - 	He nodded again.
			* * *	'But can we win?'
					'That is what we will endeavour to find out,' he answered.
			* * *	'A modest wager, I trust?'
					'Twenty thousand pounds,' he replied, quite flatly.
			* * * 	I asked nothing further of him then[.], and after a final, polite cough, he offered nothing more to me. <>
	* * 	'Ah[.'],' I replied, uncertain what I thought.
	- - 	After that, <>
*	... but I said nothing[] and <> 
- we passed the day in silence.
- -> END