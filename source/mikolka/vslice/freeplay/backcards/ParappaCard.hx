package mikolka.vslice.freeplay.backcards;

import flixel.addons.display.FlxBackdrop;
import mikolka.compatibility.FreeplayHelpers;
import flixel.math.FlxMath;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import openfl.display.BlendMode;
import flixel.group.FlxSpriteGroup;

import mikolka.compatibility.FunkinPath as Paths;

class ParappaCard extends BackingCard
{
  var darkRedDots:FlxSprite;
  var orangeDots:FlxSprite;
  var yellowdots:FlxSprite;

  var confirmAtlas:FlxAtlasSprite;

  public override function init():Void
  {
    FlxTween.tween(pinkBack, {x: 0}, 0.6, {ease: FlxEase.quartOut});
    add(pinkBack);

    darkRedDots = new FlxSprite(-300, -150).loadGraphic(Paths.image('freeplay/backingCards/parappa/DarkRedDots'));
    FlxG.state.subState.insert(FlxG.state.subState.members.indexOf(FlxG.state.subState.dj), darkRedDots);
    darkRedDots.angle = 0;
    darkRedDots.cameras = [FlxG.state.subState.funnyCam];

    orangeDots = new FlxSprite(-300, -150).loadGraphic(Paths.image('freeplay/backingCards/parappa/OrangeDots'));
    FlxG.state.subState.insert(FlxG.state.subState.members.indexOf(FlxG.state.subState.dj), orangeDots);
    orangeDots.scale.x = 0.45;
    orangeDots.scale.y = 0.45;
    orangeDots.angle = 0;
    orangeDots.cameras = [FlxG.state.subState.funnyCam];

    YellowDots = new FlxSprite(-300, -150).loadGraphic(Paths.image('freeplay/backingCards/parappa/YellowDots'));
    FlxG.state.subState.insert(FlxG.state.subState.members.indexOf(FlxG.state.subState.dj), YellowDots);
    YellowDots.scale.x = 0.2;
    YellowDots.scale.y = 0.2;
    YellowDots.angle = 0;
    YellowDots.cameras = [FlxG.state.subState.funnyCam];

    darkRedDots.visible = false;
    orangeDots.visible = false;
    YellowDots.visible = false;

    confirmAtlas = new FlxAtlasSprite(3, 55, Paths.animateAtlas("freeplay/backingCards/parappa/parappa-confirm"));
    confirmAtlas.visible = false;
    add(confirmAtlas);

  }

  override public function confirm():Void
  {
    confirmAtlas.visible = true;
    confirmAtlas.anim.play("");

    FlxTween.color(instance.bgDad, 10 / 24, 0xFFFFFFFF, 0xFF8A8A8A,
      {
        ease: FlxEase.expoOut,
        onUpdate: function(_) {
          instance.angleMaskShader.extraColor = instance.bgDad.color;
        }
      });

    new FlxTimer().start(10 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF343036, 0xFF696366,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(14 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF27292D, 0xFF686A6F,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(18 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF2D282D, 0xFF676164,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(21 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF29292F, 0xFF62626B,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });

    new FlxTimer().start(24 / 24, function(_) {
      // shoot
      FlxTween.color(instance.bgDad, 3 / 24, 0xFF29232C, 0xFF808080,
        {
          ease: FlxEase.expoOut,
          onUpdate: function(_) {
            instance.angleMaskShader.extraColor = instance.bgDad.color;
          }
        });
    });
  }

  var beatFreq:Int = 1;
  var beatFreqList:Array<Int> = [1, 2, 4, 8];

  public override function beatHit(curBeat:Int):Void
  {
    // increases the amount of beats that need to go by to pulse the glow because itd flash like craazy at high bpms.....
    beatFreq = beatFreqList[Math.floor(FreeplayHelpers.BPM / 140)];

    if (curBeat % beatFreq != 0) return;
    FlxTween.cancelTweensOf(glow);

    glow.alpha = 1;
    FlxTween.tween(glow, {alpha: 0}, 16 / 24, {ease: FlxEase.quartOut});
  }

  public override function introDone():Void
  {
    pinkBack.color = 0xFF6620AD;

    darkRedDots.visible = true;
    orangeDots.visible = true;
    YellowDots.visible = true;
    cardGlow.visible = true;

    cardGlow.visible = true;
    FlxTween.tween(cardGlow, {alpha: 0, "scale.x": 1.2, "scale.y": 1.2}, 0.45, {ease: FlxEase.sineOut});
  }

  public override function disappear():Void
  {
    FlxTween.color(pinkBack, 0.25, 0xFF98A2F3, 0xFFFFD0D5, {ease: FlxEase.quadOut});

    darkRedDots.angle = 0;
    orangeDots.angle = 0;
    YellowDots.angle = 0;
    darkRedDots.visible = false;
    orangeDots.visible = false;
    YellowDots.visible = false;
  }
}
