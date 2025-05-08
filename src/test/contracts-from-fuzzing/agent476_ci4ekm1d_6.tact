struct Deeply {
  foo: Int;
}

struct Middle {
  deep: Deeply?;
}

contract OptionalMid {
  m: Middle;

  init() {
    self.m = Middle{ deep: null };
  }

  receive() {
    if (self.m.deep != null) {
      let _ = self.m.deep!!;
    }
  }
}