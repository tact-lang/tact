struct IntsOnly {
  a: Int;
  b: Int;
}

struct BoolsOnly {
  a: Bool;
  b: Bool;
}

contract IntBoolMix {
  i: IntsOnly;
  b: BoolsOnly;

  init() {
    self.i = IntsOnly{a:1, b:2};
    self.b = BoolsOnly{a:true,b:false};
  }
}
