// Defines the process to monitor. We are not reading anything from the game’s memory, so it’s empty.
// We still need it though, LiveSplit will only run the auto splitter if the corresponding process is present.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#state-descriptors
state("EliteDangerous64") {}

// Executes when LiveSplit (re-)loads the auto splitter. Does general setup tasks.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#script-startup
startup {
	// Relevant journal entries
	vars.journalReader = null;
	vars.journalEntries = new List<System.Text.RegularExpressions.Regex>(32);
	// Start
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""Undocked"", ""StationName"":""Ashton Gateway"", ""StationType"":"".*"", ""MarketID"":\d+(, ""Taxi"":(true|false), ""Multicrew"":(true|false))? \}"));

	// Stop 1
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 2
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 3
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 4
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 5
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 6
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 7
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 8
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

	// Stop 9
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", ""SystemAddress"":\d+, ""Body"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""BodyID"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", (""event"":""Docked"", ""StationName"":""(Somerset Station|Furukawa Terminal|Velho Dock|Collins Dock|Pawelczyk Hangar|al-Khayyam Hub|Henslow City|Xiaoguan Hub|Vonarburg Co-operative)"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""(I Carinae|HDS 1065|HIP 71515|FAUST 3566|Wolf 1060|Veneri|BD-17 3725|Eta Corvi|Magec|Wyrd)"", .*\ |""event"":""Touchdown"", ""PlayerControlled"":true(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, .*)\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));

// --------------------
// Move this section to location of your BD-17 3725 stop
	// BD-17 3725 - Stop and go
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""BD-17 3725"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""StartJump"", ""JumpType"":""Hyperspace"", .*\}"));
//
// --------------------

	// Return
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""FSDJump""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""VZ Corvi"", ""SystemAddress"":\d+, .*\}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""SupercruiseExit""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""VZ Corvi"", ""SystemAddress"":\d+, ""Body"":""Ashton Gateway"", ""BodyID"":\d+, ""BodyType"":""Station"" \}"));
	vars.journalEntries.Add(
		new System.Text.RegularExpressions.Regex(@"\{ ""timestamp"":""(?<timestamp>.*)"", ""event"":""Docked"", ""StationName"":""Ashton Gateway"", ""StationType"":"".*""(, ""Taxi"":(true|false), ""Multicrew"":(true|false))?, ""StarSystem"":""VZ Corvi"", .*\}"));

	// Journal file handling
	vars.journalPath = Path.Combine(
		Environment.GetFolderPath(Environment.SpecialFolder.UserProfile),
		"Saved Games",
		"Frontier Developments",
		"Elite Dangerous"
		);
	vars.currentJournal = "none";
	vars.updateJournalReader = (Action)delegate() {
		FileInfo journalFile = new DirectoryInfo(vars.journalPath).GetFiles("journal.*.log").OrderByDescending(file => file.LastWriteTime).First();
		print("Current journal file: " + vars.currentJournal + ", latest journal file: " + journalFile.Name);
		if (journalFile.Name != vars.currentJournal) {
			vars.journalReader = new StreamReader(new FileStream(journalFile.FullName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite));
			vars.currentJournal = journalFile.Name;
		}
	};
	vars.updateJournalReader();
	vars.journalReader.ReadToEnd();

	// Watch for new files
	FileSystemWatcher journalWatcher = new FileSystemWatcher(vars.journalPath);
	journalWatcher.Created += (object sender, FileSystemEventArgs eventArgs) => {
		vars.updateJournalReader();
	};
	journalWatcher.EnableRaisingEvents = true;

	// Initialize split counter
	vars.currentSplit = 0;
}

// Executes when LiveSplit detects the game process (see “state” at the top of the file).
// In our case the journal and netlog files are unique to every execution of the game, so we need to prepare them here.
// We also need to check if file logging is enabled (the setting is not available in `startup`) and create/open our log file.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#script-initialization-game-start
init {
}

// Executes as long as the game process is running, by default 60 times per second.
// Unless explicitly returning `false`, `start`, `split` and `reset` are executed right after.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#generic-update
update {
	current.journalString = vars.journalReader.ReadToEnd();
}

// Executes every `update`. Starts the timer if the first journal event is detected.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#automatic-timer-start-1
start {
	bool start = false;

	if (vars.journalEntries[0].Match(current.journalString).Success) {
		start = true;
		vars.currentSplit = 1;
	}

	return start;
}

// Executes every `update`. Triggers a split if the journal event triggering the next split is detected.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#automatic-splits-1
split {
	bool split = false;
	
	if (!String.IsNullOrEmpty(current.journalString)) {
		if (vars.journalEntries[vars.currentSplit].Match(current.journalString).Success) {
			split = true;
			vars.currentSplit++;
		}
	}

	return split;
}

// Executes when the game process is shut down.
// In our case we’re going to close the files we opened in `init`.
// See https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#game-exit
exit {
	vars.journalReader.Close();
}

// Executes when LiveScript shuts the auto splitter down, e.g. on reloading it.
// When reloading the splitter with the game running, LiveSplit does **not** execute `exit`, but it does execute `shutdown`.
// see https://github.com/LiveSplit/LiveSplit.AutoSplitters/blob/master/README.md#script-shutdown
shutdown {
	if (vars.journalReader != null) {
		vars.journalReader.Close();
	}
}
