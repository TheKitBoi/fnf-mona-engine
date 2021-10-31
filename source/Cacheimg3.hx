package;

import Controls.KeyboardScheme;
import Controls.Control;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.util.FlxTimer;

class Cacheimg3 extends MusicBeatState
{
	var selector:FlxText;
	var curSelected:Int = 0;
	///var songs:Array<String> = [
		///"glitcher"
	///];

	var controlsStrings:Array<String> = [];
	public static var gameVer:String = "0.2.7.1";
	public static var sniperengineversion:String = "0.1";
	var versionShit:FlxText;
	var done:FlxSprite;
	var magenta:FlxSprite;
	override function create()
	{
			{
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
					{
						Cache();
					});	
			}
		
			magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
			magenta.scrollFactor.x = 0;
			magenta.scrollFactor.y = 0.18;
			magenta.setGraphicSize(Std.int(magenta.width * 1.1));
			magenta.updateHitbox();
			magenta.screenCenter();
			magenta.antialiasing = true;
			magenta.color = 0xFF00ff51;
			add(magenta);
		
		var done:FlxSprite = new FlxSprite(0,-80).loadGraphic(Paths.image('imagesdone'));
		done.scrollFactor.x = 0;
		done.scrollFactor.y = 0.18;
		done.setGraphicSize(Std.int(done.width * 1.1));
		done.updateHitbox();
		done.antialiasing = true;
		done.visible = false;
		add(done);

		
			  var ctrl:Alphabet = new Alphabet(0, (70) + 30, "caching week three images");
            #if windows
            ctrl.color = FlxColor.WHITE;
            #end
			ctrl.screenCenter(X);
		    add(ctrl);
			// DONT PUT X IN THE FIRST PARAMETER OF new ALPHABET() !!
		
			
		var versionShit:FlxText = new FlxText(0, 0 , CachedFramesimg3.progress, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

			if (controls.ACCEPT)
			{
				switch(curSelected)
				{
				}
			}

			if(CachedFramesimg3.loaded)
				{
					///done.visible = true;
					new FlxTimer().start(0.5, function(tmr:FlxTimer)
						{
						   FlxG.switchState(new Cacheimg4());
						});		
				}
	
	}

	var isSettingControl:Bool = false;




	function Cache():Void
		{
			CachedFramesimg3.loadEverything();
		}


		/*function preloadSongs()
			{
				for (i in songs) // caching all songs so loading is faster
				{
					FlxG.sound.cache(Paths.inst(i));
					FlxG.sound.cache(Paths.voices(i));
					trace('Loaded inst');
				}
		
			       // for some reason paths doesn't work???
		
				/*new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					var done:FlxSprite = new FlxSprite(0,-160).loadGraphic(Paths.image('musicdone'));
								done.scrollFactor.x = 0;
								done.scrollFactor.y = 0.18;
								done.setGraphicSize(Std.int(done.width * 1.1));
								done.updateHitbox();
								done.antialiasing = true;
								add(done);

				*///});
				///}
}
