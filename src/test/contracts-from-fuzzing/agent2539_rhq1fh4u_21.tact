struct HasBool {
  x: Bool;
  y: Int;
}

contract MixedDefaults {
  p: Int = 100;
  q: Bool = true;
  r: String = "abc";
  s: HasBool = HasBool{x:true,y:1};

  init() {
    self.p = 42;
    self.q = false;
    self.r = "zzz";
    self.s = HasBool{x:false,y:7};
  }
}
