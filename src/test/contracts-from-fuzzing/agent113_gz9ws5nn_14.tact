struct OptNested {
  opt: Inner?;
}

struct Inner {
  val: Int;
}

contract TestOptNested {
  s: OptNested;

  init() {
    self.s = OptNested{opt: null};
  }
}