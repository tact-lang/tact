struct Basic {
 a: Int;
 b: Bool;
}

contract OptStructDefaults {
  sf: Basic? = null;

  init() {
    self.sf = Basic{a:3,b:true};
  }
}