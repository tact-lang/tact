struct Inner {
  a: Int;
  b: Bool;
}

contract OptStructDefaults {
  f: Inner? = null;

  init() {
    self.f = Inner{a:1,b:true};
  }
}