package;

import Controls.KeyboardScheme;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.utils.Assets;

class ControlState extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;

	var controlsStrings:Array<String> = [];

	private var grpControls:FlxTypedGroup<Alphabet>;
	var versionShit:FlxText;
	var camZoom:FlxTween;
	var CYAN:FlxColor = 0xFF00FFFF;
	override function create()
	{
		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		controlsStrings = CoolUtil.coolStringFile('DFJK' + "\n" + "WASD" + "\n" + "ZX TWO THREE" + "\n" + "ASKL" + "\n" + "ARROWS" + "\n" + "CUSTOM");
		
		trace(controlsStrings);

		menuBG.color = 0xFFea71fd;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.antialiasing = true;
		add(menuBG);

		grpControls = new FlxTypedGroup<Alphabet>();
		add(grpControls);

		for (i in 0...controlsStrings.length)
		{
				var controlLabel:Alphabet = new Alphabet(0, (70 * i) + 30, controlsStrings[i], true, false);
				controlLabel.isMenuItem = true;
				controlLabel.targetY = i;
				grpControls.add(controlLabel);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		}

		super.create();
	}

	override function update(elapsed:Float)
	{

		if (FlxG.sound.music != null)
            Conductor.songPosition = FlxG.sound.music.time;

		super.update(elapsed);

			if (controls.BACK)
				FlxG.switchState(new MenuState());
			if (controls.UP_P)
				changeSelection(-1);
			if (controls.DOWN_P)
				changeSelection(1);
			if (controls.BACK)
			FlxG.sound.play(Paths.sound('cancelMenu'), 0.4);
			

			if (controls.ACCEPT)
			{
				if (curSelected != 4)
					grpControls.remove(grpControls.members[curSelected]);
				switch(curSelected)
				{
					case 0:
						controls.setKeyboardScheme(KeyboardScheme.Duo(true), true);
						FlxG.switchState(new ControlState());
						FlxG.save.data.controls = false;
					case 1:
						controls.setKeyboardScheme(KeyboardScheme.Duo(false), true);
						FlxG.switchState(new ControlState());
						FlxG.save.data.controls = false;
					case 2:
						controls.setKeyboardScheme(KeyboardScheme.Woops, true);
						FlxG.switchState(new ControlState());
						FlxG.save.data.controls = false;
					case 3:
						controls.setKeyboardScheme(KeyboardScheme.Augustine, true);
						FlxG.switchState(new ControlState());
						FlxG.save.data.controls = false;
					case 4:
						controls.setKeyboardScheme(KeyboardScheme.Solo, true);
						FlxG.switchState(new ControlState());
						FlxG.save.data.controls = false;
					case 5:
						controls.setKeyboardScheme(KeyboardScheme.Custom, true);
						FlxG.switchState(new OptionsMenu());
						FlxG.save.data.controls = false;
						TitleState.resetBinds();
				}
			}
	}

	var isSettingControl:Bool = false;

	function changeSelection(change:Int = 0)
	{
		#if !switch
		// NGio.logEvent('Fresh');
		#end
		
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);

		curSelected += change;

		if (curSelected < 0)
			curSelected = grpControls.length - 1;
		if (curSelected >= grpControls.length)
			curSelected = 0;

		// selector.y = (70 * curSelected) + 30;

		var bullShit:Int = 0;

		for (item in grpControls.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			item.alpha = 0.6;

			#if windows
			item.color = FlxColor.WHITE;
            #end
			// item.setGraphicSize(Std.int(item.width * 0.8));

			if (item.targetY == 0)
			{
				item.alpha = 1;
				#if windows
				item.color = FlxColor.CYAN;
				#end
				// item.setGraphicSize(Std.int(item.width));
			}
		}
	}



	override function beatHit()
		{
			super.beatHit();


			if (accepted)
				{
					bopOnBeat();
					///iconBop();
					trace(curBeat);
				}
		}

		function bopOnBeat()
			{
				if (accepted)
				{
						    if (curBeat % 1 == 0)
						    	{
									if (TitleState.old)
										{
											trace('no');
										}
										else
											{
												FlxG.camera.zoom += 0.015;
												camZoom = FlxTween.tween(FlxG.camera, {zoom: 1}, 0.1);
												trace('zoom');
											}
							    }

				}
			}

	var accepted:Bool = true;
}