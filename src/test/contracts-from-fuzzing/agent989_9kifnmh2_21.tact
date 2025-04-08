struct MixedDefaults {
  a: Int = 1;
  b: Bool;
  c: String = "hi";
  d: Bool;
}

contract MixedDefaultsC {
  val: MixedDefaults;

  init() {
    self.val = MixedDefaults{ b:true,d:false };
  }
}