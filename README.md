# LiveSplit files for The Triple Eight Championship: Lucky Bucky Landing

LiveSplit files and AutoSplitters for The Triple Eight Championship: Lucky Bucky Landing organized by the Buckyball Racing Club: <https://forums.frontier.co.uk/threads/the-buckyball-racing-club-presents-season-3-the-triple-eight-championship-lucky-bucky-landing-slots.624564/>

Don’t know what [“LiveSplit”](https://livesplit.org) is? It allows you to time speedruns of your favourite games!

Based up on the LiveSplit files created by [alterNERDtive](https://github.com/alterNERDtive/LiveSplit-Elite-Magic-8-Ball-Championship) for the Magic 8-Ball Championship 

## Setup

1. Download LiveSplit from <https://livesplit.org/downloads/> and unzip it to a directory of your choosing.
2. Download this repository (green button in the top right of the repostory view → “Download ZIP”) and extract it to a directory of your choosing. Alternatively, clone the git repository.
3. Launch LiveSplit and do the following:
   - Right click, Open Splits, select `[name of the race].lss`.
   - Right click, Open Layout, select `[name of the race].lsl`.
   - Right click, Edit Layout, Layout Settings, then in “Scriptable Auto Splitter”, set `[name of the race].asl` as the script path.
4. Right click, Save Layout As…, save to wherever. This means your changes in the layout (e.g. changing colours) and associating the auto splitter will not be lost on updates.
5. Right click, Save Splits As…, save to wherever. This ensures that your personal times will not be lost on updates.

**Please note times provided by Livesplit are for your own referance, Buckyball offical timing is done via the in-game clock.**


## Races

### Race 8 – X^2 Marks the Dash

<https://forums.frontier.co.uk/threads/buckyball-racing-club-presents-x-2-marks-the-dash-triple-eight-championship-race-8.631210/>

The AutoSplitter will start the timer once you undock from Ashton Gateway station.   
   
The files will need an edit to move the location of the stop "BD-17 3725", This is due to the stop being a "stop and go" with no station to land at so it's missing the drop and dock segments.   
If it's your last stop then you won't need to make any changes.   

To move the stop, open up the file `X2 Marks The Dash.asl` in a text editor, then scroll down until you reach the following.   

```
// --------------------
// Move this section to location of your BD-17 3725 stop
```

Highlight from above section down to   

```
//
// --------------------
```

and cut, then find the stop you want to put it before and paste above the line `// Stop N` line and save the file   

Then open the `X2 Marks The Dash.lss` in a text editor and scroll down to line   
`<!-- Move this Segment to where you want the BD-17 3725 system to be -->`   
Highlight from the line above down to    
`<!-- End of BD-17 3725 Segment -->`   
Then cut the section and locate the stop you want to put it before and paste above the `<!-- End <system number> system Segment -->` line.   

Once both are edited and saved you can open them in Livesplit.   

If there are any issues with moving the split location for the BD-17 3725 stop, let me know which stop number you would like to be and I can send over updated files.   


### Race 7 – Once Upon a Time in Leesti

<https://forums.frontier.co.uk/threads/the-buckyball-racing-club-presents-once-upon-a-time-in-leesti-triple-eight-championship-race-7.628808/>

The AutoSplitter will start the timer once you undock from George Lucas station.   

Since the order in which you visit the race’s stops is up to you, the splits do not have a specific order and instead just list the nth stop.   

I haven't had time to look at over the Shenanigan Class stops in detail yet, I'm not sure how best to add in shenanigan stops in at the moment.   
However, this will still work for Shenanigan Class runs.   



### Race 6 – Ruby's Road

<https://forums.frontier.co.uk/threads/the-buckyball-racing-club-presents-rubys-road-triple-eight-championship-race-6.627944/>

The AutoSplitter will start the timer once you undock from Goeshek Horizons.   

The Secure Your Invite stage can either be done at the start or at end of the run so I have done 2 split files.   

The "Ruby's Road" files are for the order listed on the forum, with Hidden Field Hacienda being the first stop.   
If you will be doing Hidden Field Hacienda after the naming ceremony then use the "Ruby's Road - Hidden Field Last" files.   


### Race 5 – Zombaland

<https://forums.frontier.co.uk/threads/the-buckyball-racing-club-presents-zombaland-triple-eight-championship-race-5.627461/>

The AutoSplitter will start the timer once you undock from Culpeper Gateway.   
Since the order in which you visit the race’s stops is up to you, the splits do not have a specific order and instead just list the nth stop.   

Due to the differing number of stops there are 2 split and auto splitter files, one for regulation and one for unlimted.   
Zombaland - Regulation   
Zombaland - Unlimited   


### Race 4 – Questing on Qixi

<https://forums.frontier.co.uk/threads/buckyball-racing-club-presents-questing-on-qixi-triple-eight-championship-race-4.626880/>

The AutoSplitter will start the timer once you undock from the one of the start stations.   
Since the order in which you visit the race’s stops is up to you, the splits do not have a specific order and instead just list the nth stop.   

There are 4 split and auto splitter files depending on how many of the Seven Sisters systems you are stopping in.   
Questing on Qixi - 4S - 4 systems - Minimum number required   
Questing on Qixi - 5S - 5 systems - 1 bonus system   
Questing on Qixi - 6S - 6 systems - 2 bonus system   
Questing on Qixi - 7S - 7 systems - 3 bonus system   

### Race 3 – Pop Gun:Buckyball

<https://forums.frontier.co.uk/threads/the-buckyball-racing-club-presents-pop-gun-buckyball-race-3-of-the-triple-8-championship.626068/>

The AutoSplitter will start the timer once you undock from the Fleet Carrier "Penny Benjamin"   
Since the order in which you visit the race’s stops is up to you, the splits do not have a specific order and instead just list the nth stop.   

### Race 2 – Ring Tossers Rally

<https://forums.frontier.co.uk/threads/buckyball-racing-club-and-loose-screws-presents-ring-tossers-rally-triple-eight-championship-race-2.625638/>

The AutoSplitter will start the timer once you undock from Bunch City.   
I couldn't see a way in the logs to track ring passes, so this a simple undock/redock timer.   


### Race 1 – The Sidewinder Trophy

<https://forums.frontier.co.uk/threads/the-sidewinder-trophy.624695/>

The AutoSplitter will start the timer once you undock from Wright Station.   




