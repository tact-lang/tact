struct Inner {
  flag: Bool = false;
}

struct Middle {
  optInner: Inner?;
}

struct Outer {
  middle: Middle;
}

contract Test {
  data: Outer = Outer{ middle: Middle{ optInner: null } };
  init() {}
}