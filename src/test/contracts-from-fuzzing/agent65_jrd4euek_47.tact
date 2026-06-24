struct Mix {
 a:Int; b:Int? = null; c:Bool; d:Bool? = null;
}

contract MixDefaults {
 field:Mix;
 init() {
  self.field=Mix{ a:1, c:true };
 }
}