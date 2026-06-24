struct BoolWr {
  flag: Bool;
}

struct Wrap {
  inner: BoolWr;
}

contract OptOuter {
  w: Wrap?;

  init() {
    self.w = null;
  }
}