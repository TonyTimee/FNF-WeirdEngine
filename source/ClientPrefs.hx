package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import lime.system.DisplayMode;
import lime.app.Application;
import Controls;

class ClientPrefs
{
	public static var vSyncFPS:Int = 60;
	public static var curFramerate:Int = 60;

	public static var language:String = null;
	public static var downScroll:Bool = false;
	public static var middleScroll:Bool = false;
	public static var opponentStrums:Bool = true;
	public static var showFPS:Bool = #if desktop true #else false #end;
	public static var flashing:Bool = true;
	public static var globalAntialiasing:Bool = true;
	public static var unfocuPause:Bool = true;
	public static var noteSplashes:Bool = true;
	public static var lowQuality:Bool = false;
	public static var framerate:Dynamic = #if desktop 'V-Sync' #else 60 #end;
	//public static var framerate:Dynamic = 60;
	public static var cursing:Bool = true;
	public static var violence:Bool = true;
	public static var camZooms:Bool = true;
	public static var hideHud:Bool = false;
	public static var noteOffset:Int = 0;
	//public static var arrowHSV:Array<Array<Int>> = [
	//	[0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0], [0, 0, 0]];
	public static var arrowHSV:Map<String, Array<Int>> = [
		'A' => [0, 0, 0],
		'B' => [0, 0, 0],
		'C' => [0, 0, 0],
		'D' => [0, 0, 0],
		'E' => [0, 0, 0],
		'F' => [0, 0, 0],
		'G' => [0, 0, 0],
		'H' => [0, 0, 0],
		'I' => [0, 0, 0],
		'J' => [0, 0, 0],
		'K' => [0, 0, 0],
		'L' => [0, 0, 0],
		'M' => [0, 0, 0],
		'N' => [0, 0, 0],
		'O' => [0, 0, 0],
		'P' => [0, 0, 0],
		'Q' => [0, 0, 0],
		'R' => [0, 0, 0]
	];
	public static var imagesPersist:Bool = false;
	public static var ghostTapping:Bool = true;
	public static var timeBarType:String = 'Time Left';
	public static var scoreZoom:Bool = true;
	public static var cameraMovement:Bool = true;
	public static var noReset:Bool = false;
	public static var healthBarAlpha:Float = 1;
	public static var controllerMode:Bool = false;

	//this is a WIP
	//public static var controlMode:String = #if desktop 'keyboard' #elseif mobile 'touch' #else 'controller' #end;
	
	public static var hitsoundVolume:Float = 0;
	public static var pauseMusic:String = 'Breakfast';
	public static var subtitles:Bool = true;
	public static var checkForUpdates:Bool = true;
	public static var checkForPsychUpdates:Bool = true;
	public static var soundEffectVolume:Float = 1;
	public static var gameplaySettings:Map<String, Dynamic> = [
		'scrollspeed' => 1.0,
		'scrolltype' => 'multiplicative',
		// anyone reading this, amod is multiplicative speed mod, cmod is constant speed mod, and xmod is bpm based speed mod.
		// an amod example would be chartSpeed * multiplier
		// cmod would just be constantSpeed = chartSpeed
		// and xmod basically works by basing the speed on the bpm.
		// iirc (beatsPerSecond * (conductorToNoteDifference / 1000)) * noteSize (110 or something like that depending on it, prolly just use note.height)
		// bps is calculated by bpm / 60
		// oh yeah and you'd have to actually convert the difference to seconds which I already do, because this is based on beats and stuff. but it should work
		// just fine. but I wont implement it because I don't know how you handle sustains and other stuff like that.
		// oh yeah when you calculate the bps divide it by the songSpeed or rate because it wont scroll correctly when speeds exist.
		'songspeed' => 1.0,
		'healthgain' => 1.0,
		'healthloss' => 1.0,
		'instakill' => false,
		'practice' => false,
		'botplay' => false,
		'opponentplay' => false
	];

	public static var comboOffset:Array<Int> = [0, 0, 0, 0];
	public static var raitingInStage:Bool = false;
	public static var noAntimash:Bool = false;
	public static var ratingOffset:Int = 0;
	public static var sickWindow:Int = 45;
	public static var goodWindow:Int = 90;
	public static var badWindow:Int = 135;
	public static var safeFrames:Float = 10;

	// Every key has two binds, add your key bind down here and then add your control on options/ControlsSubState.hx and Controls.hx
	public static var keyBinds:Map<String, Array<FlxKey>> = [
		// Key Bind, Name for ControlsSubState
		'note_one1' => [SPACE, NONE],
		'note_two1' => [D, NONE],
		'note_two2' => [K, NONE],
		'note_three1' => [D, NONE],
		'note_three2' => [SPACE, NONE],
		'note_three3' => [K, NONE],
		'note_left' => [A, LEFT],
		'note_down' => [S, DOWN],
		'note_up' => [W, UP],
		'note_right' => [D, RIGHT],
		'note_five1' => [D, NONE],
		'note_five2' => [F, NONE],
		'note_five3' => [SPACE, NONE],
		'note_five4' => [J, NONE],
		'note_five5' => [K, NONE],
		'note_six1' => [S, NONE],
		'note_six2' => [D, NONE],
		'note_six3' => [F, NONE],
		'note_six4' => [J, NONE],
		'note_six5' => [K, NONE],
		'note_six6' => [L, NONE],
		'note_seven1' => [S, NONE],
		'note_seven2' => [D, NONE],
		'note_seven3' => [F, NONE],
		'note_seven4' => [SPACE, NONE],
		'note_seven5' => [J, NONE],
		'note_seven6' => [K, NONE],
		'note_seven7' => [L, NONE],
		'note_eight1' => [A, NONE],
		'note_eight2' => [S, NONE],
		'note_eight3' => [D, NONE],
		'note_eight4' => [F, NONE],
		'note_eight5' => [H, NONE],
		'note_eight6' => [J, NONE],
		'note_eight7' => [K, NONE],
		'note_eight8' => [L, NONE],
		'note_nine1' => [A, NONE],
		'note_nine2' => [S, NONE],
		'note_nine3' => [D, NONE],
		'note_nine4' => [F, NONE],
		'note_nine5' => [SPACE, NONE],
		'note_nine6' => [H, NONE],
		'note_nine7' => [J, NONE],
		'note_nine8' => [K, NONE],
		'note_nine9' => [L, NONE],
		'note_ten1' => [A, NONE],
		'note_ten2' => [S, NONE],
		'note_ten3' => [D, NONE],
		'note_ten4' => [F, NONE],
		'note_ten5' => [G, NONE],
		'note_ten6' => [SPACE, NONE],
		'note_ten7' => [H, NONE],
		'note_ten8' => [J, NONE],
		'note_ten9' => [K, NONE],
		'note_ten10' => [L, NONE],
		'note_elev1' => [A, NONE],
		'note_elev2' => [S, NONE],
		'note_elev3' => [D, NONE],
		'note_elev4' => [F, NONE],
		'note_elev5' => [G, NONE],
		'note_elev6' => [SPACE, NONE],
		'note_elev7' => [H, NONE],
		'note_elev8' => [J, NONE],
		'note_elev9' => [K, NONE],
		'note_elev10' => [L, NONE],
		'note_elev11' => [PERIOD, NONE],
		'ui_left' => [A, LEFT],
		'ui_down' => [S, DOWN],
		'ui_up' => [W, UP],
		'ui_right' => [D, RIGHT],
		'accept' => [SPACE, ENTER],
		'back' => [BACKSPACE, ESCAPE],
		'pause' => [ENTER, ESCAPE],
		'reset' => [R, NONE],
		'fullscreen' => [F11, NONE],
		'volume_mute' => [ZERO, NONE],
		'volume_up' => [NUMPADPLUS, PLUS],
		'volume_down' => [NUMPADMINUS, MINUS],
		'debug_1' => [SEVEN, NONE],
		'debug_2' => [EIGHT, NONE],
		'debug_3' => [SIX, NONE]
	];
	public static var defaultKeys:Map<String, Array<FlxKey>> = null;

	public static function loadDefaultKeys()
	{
		defaultKeys = keyBinds.copy();
		// trace(defaultKeys);
	}

	public static function saveSettings()
	{
		FlxG.save.data.downScroll = downScroll;
		FlxG.save.data.middleScroll = middleScroll;
		FlxG.save.data.opponentStrums = opponentStrums;
		FlxG.save.data.showFPS = showFPS;
		FlxG.save.data.flashing = flashing;
		FlxG.save.data.globalAntialiasing = globalAntialiasing;
		FlxG.save.data.unfocuPause = unfocuPause;
		FlxG.save.data.noteSplashes = noteSplashes;
		FlxG.save.data.lowQuality = lowQuality;
		FlxG.save.data.framerate = framerate;
		// FlxG.save.data.cursing = cursing;
		// FlxG.save.data.violence = violence;
		FlxG.save.data.camZooms = camZooms;
		FlxG.save.data.noteOffset = noteOffset;
		FlxG.save.data.hideHud = hideHud;
		FlxG.save.data.hsv11 = arrowHSV;
		FlxG.save.data.imagesPersist = imagesPersist;
		FlxG.save.data.ghostTapping = ghostTapping;
		FlxG.save.data.timeBarType = timeBarType;
		FlxG.save.data.language = language;
		FlxG.save.data.scoreZoom = scoreZoom;
		FlxG.save.data.cameraMovement = cameraMovement;
		FlxG.save.data.noReset = noReset;
		FlxG.save.data.healthBarAlpha = healthBarAlpha;
		FlxG.save.data.comboOffset = comboOffset;
		FlxG.save.data.achievementsMap = Achievements.achievementsMap;
		FlxG.save.data.henchmenDeath = Achievements.henchmenDeath;
		FlxG.save.data.noAntimash = noAntimash;
		FlxG.save.data.raitingInStage = raitingInStage;
		FlxG.save.data.ratingOffset = ratingOffset;
		FlxG.save.data.sickWindow = sickWindow;
		FlxG.save.data.goodWindow = goodWindow;
		FlxG.save.data.badWindow = badWindow;
		FlxG.save.data.safeFrames = safeFrames;
		FlxG.save.data.gameplaySettings = gameplaySettings;
		FlxG.save.data.controllerMode = controllerMode;

		//this is a WIP
		//FlxG.save.data.controlMode = controlMode;

		FlxG.save.data.hitsoundVolume = hitsoundVolume;
		FlxG.save.data.pauseMusic = pauseMusic;
		FlxG.save.data.subtitles = subtitles;
		FlxG.save.data.checkForUpdates = checkForUpdates;
		FlxG.save.data.checkForPsychUpdates = checkForPsychUpdates;
		FlxG.save.data.soundEffectVolume = soundEffectVolume;

		FlxG.save.flush();

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99'); // Placing this in a separate save so that it can be manually deleted without removing your Score and stuff
		save.data.customControls = keyBinds;
		save.flush();
		FlxG.log.add("Settings saved!");
	}

	public static function loadPrefs()
	{
		vSyncFPS = Math.round(Application.current.window.displayMode.refreshRate);
		trace(vSyncFPS);

		if (FlxG.save.data.downScroll != null)
		{
			downScroll = FlxG.save.data.downScroll;
		}
		if (FlxG.save.data.middleScroll != null)
		{
			middleScroll = FlxG.save.data.middleScroll;
		}
		if(FlxG.save.data.opponentStrums != null) {
			opponentStrums = FlxG.save.data.opponentStrums;
		}
		if (FlxG.save.data.showFPS != null)
		{
			showFPS = FlxG.save.data.showFPS;
			if (Main.fpsVar != null)
			{
				Main.fpsVar.visible = showFPS;
			}
		}
		if (FlxG.save.data.flashing != null)
		{
			flashing = FlxG.save.data.flashing;
		}
		if (FlxG.save.data.globalAntialiasing != null)
		{
			globalAntialiasing = FlxG.save.data.globalAntialiasing;
		}
		if (FlxG.save.data.unfocuPause != null)
		{
			unfocuPause = FlxG.save.data.unfocuPause;
		}
		if (FlxG.save.data.noteSplashes != null)
		{
			noteSplashes = FlxG.save.data.noteSplashes;
		}
		if (FlxG.save.data.lowQuality != null)
		{
			lowQuality = FlxG.save.data.lowQuality;
		}
		if (FlxG.save.data.framerate != null)
		{
			framerate = FlxG.save.data.framerate;
		}

		if (framerate == 'V-Sync'){
			curFramerate = vSyncFPS;
		}
		else
			curFramerate = Math.round(framerate);

		if (curFramerate > FlxG.drawFramerate)
		{
			FlxG.updateFramerate = curFramerate;
			FlxG.drawFramerate = curFramerate;
		}
		else
		{
			FlxG.drawFramerate = curFramerate;
			FlxG.updateFramerate = curFramerate;
		}

		/*if(FlxG.save.data.cursing != null) {
				cursing = FlxG.save.data.cursing;
			}
			if(FlxG.save.data.violence != null) {
				violence = FlxG.save.data.violence;
		}*/
		if (FlxG.save.data.camZooms != null)
		{
			camZooms = FlxG.save.data.camZooms;
		}
		if (FlxG.save.data.hideHud != null)
		{
			hideHud = FlxG.save.data.hideHud;
		}
		if (FlxG.save.data.noteOffset != null)
		{
			noteOffset = FlxG.save.data.noteOffset;
		}
		if (FlxG.save.data.hsv11 != null && !Std.isOfType(FlxG.save.data.hsv11, Array))
		{
			arrowHSV = FlxG.save.data.hsv11;
		}
		if (FlxG.save.data.ghostTapping != null)
		{
			ghostTapping = FlxG.save.data.ghostTapping;
		}
		if (FlxG.save.data.timeBarType != null)
		{
			timeBarType = FlxG.save.data.timeBarType;
		}
		if (FlxG.save.data.language != null)
		{
			language = FlxG.save.data.language;
		}
		if (FlxG.save.data.scoreZoom != null)
		{
			scoreZoom = FlxG.save.data.scoreZoom;
		}
		if (FlxG.save.data.cameraMovement != null)
		{
			cameraMovement = FlxG.save.data.cameraMovement;
		}
		if (FlxG.save.data.noReset != null)
		{
			noReset = FlxG.save.data.noReset;
		}
		if (FlxG.save.data.healthBarAlpha != null)
		{
			healthBarAlpha = FlxG.save.data.healthBarAlpha;
		}
		if (FlxG.save.data.comboOffset != null)
		{
			comboOffset = FlxG.save.data.comboOffset;
		}

		if (FlxG.save.data.ratingOffset != null)
		{
			ratingOffset = FlxG.save.data.ratingOffset;
		}
		if (FlxG.save.data.sickWindow != null)
		{
			sickWindow = FlxG.save.data.sickWindow;
		}
		if (FlxG.save.data.goodWindow != null)
		{
			goodWindow = FlxG.save.data.goodWindow;
		}
		if (FlxG.save.data.badWindow != null)
		{
			badWindow = FlxG.save.data.badWindow;
		}
		if (FlxG.save.data.safeFrames != null)
		{
			safeFrames = FlxG.save.data.safeFrames;
		}
		if (FlxG.save.data.controllerMode != null)
		{
			controllerMode = FlxG.save.data.controllerMode;
		}
		
		//this is a WIP
		/*if (FlxG.save.data.controlMode != null)
		{
			controlMode = FlxG.save.data.controlMode;
		}
		else
		{
			if (FlxG.save.data.controllerMode)
				controlMode = FlxG.save.data.controlMode = 'controller';

			//FlxG.save.data.controllerMode = null;
		}*/

		if (FlxG.save.data.hitsoundVolume != null)
		{
			hitsoundVolume = FlxG.save.data.hitsoundVolume;
		}
		if (FlxG.save.data.pauseMusic != null)
		{
			pauseMusic = FlxG.save.data.pauseMusic;
		}
		if (FlxG.save.data.gameplaySettings != null)
		{
			var savedMap:Map<String, Dynamic> = FlxG.save.data.gameplaySettings;
			for (name => value in savedMap)
			{
				gameplaySettings.set(name, value);
			}
		}

		// flixel automatically saves your volume!
		if (FlxG.save.data.volume != null)
		{
			FlxG.sound.volume = FlxG.save.data.volume;
		}
		if (FlxG.save.data.mute != null)
		{
			FlxG.sound.muted = FlxG.save.data.mute;
		}

		if (FlxG.save.data.noAntimash != null)
		{
			noAntimash = FlxG.save.data.noAntimash;
		}

		if (FlxG.save.data.raitingInStage != null)
		{
			raitingInStage = FlxG.save.data.raitingInStage;
		}

		if (FlxG.save.data.subtitles != null)
		{
			subtitles = FlxG.save.data.subtitles;
		}

		if (FlxG.save.data.checkForUpdates != null)
		{
			checkForUpdates = FlxG.save.data.checkForUpdates;
		}

		if (FlxG.save.data.checkForPsychUpdates != null)
		{
			checkForPsychUpdates = FlxG.save.data.checkForPsychUpdates;
		}

		if (FlxG.save.data.soundEffectVolume != null)
		{
			soundEffectVolume = FlxG.save.data.soundEffectVolume;
		}

		var save:FlxSave = new FlxSave();
		save.bind('controls_v2', 'ninjamuffin99');
		if (save != null && save.data.customControls != null)
		{
			var loadedControls:Map<String, Array<FlxKey>> = save.data.customControls;
			for (control => keys in loadedControls)
			{
				keyBinds.set(control, keys);
			}
			reloadControls();
		}
	}

	inline public static function getGameplaySetting(name:String, defaultValue:Dynamic):Dynamic
	{
		return /*PlayState.isStoryMode ? defaultValue : */ (gameplaySettings.exists(name) ? gameplaySettings.get(name) : defaultValue);
	}

	public static function reloadControls()
	{
		PlayerSettings.player1.controls.setKeyboardScheme(KeyboardScheme.Solo);

		TitleState.muteKeys = copyKey(keyBinds.get('volume_mute'));
		TitleState.volumeDownKeys = copyKey(keyBinds.get('volume_down'));
		TitleState.volumeUpKeys = copyKey(keyBinds.get('volume_up'));
		FlxG.sound.muteKeys = TitleState.muteKeys;
		FlxG.sound.volumeDownKeys = TitleState.volumeDownKeys;
		FlxG.sound.volumeUpKeys = TitleState.volumeUpKeys;
	}

	public static function copyKey(arrayToCopy:Array<FlxKey>):Array<FlxKey>
	{
		var copiedArray:Array<FlxKey> = arrayToCopy.copy();
		var i:Int = 0;
		var len:Int = copiedArray.length;

		while (i < len)
		{
			if (copiedArray[i] == NONE)
			{
				copiedArray.remove(NONE);
				--i;
			}
			i++;
			len = copiedArray.length;
		}
		return copiedArray;
	}
}
