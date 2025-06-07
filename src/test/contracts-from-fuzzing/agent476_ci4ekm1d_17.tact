struct Inner {
  f: Int;
}

struct Outer {
  g: Int;
  optInner: Inner?;
}

contract OptionalInside {
  val: Outer;

  init() {
    self.val = Outer{g: 1, optInner: null};
  }

  receive() {
    if (self.val.optInner != null) {
      let _ = self.val.optInner!!;
    }
  }
}