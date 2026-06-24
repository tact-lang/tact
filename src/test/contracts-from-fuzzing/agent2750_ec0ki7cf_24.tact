struct NestedRemain {
  a: Int;
  b: Slice as remaining;
}

struct Wrap {
  inner: NestedRemain;
  c: Int;
}

contract RemainInner {
  w: Wrap;
  init() {
    self.w = Wrap {
      inner: NestedRemain { a:1, b:emptyCell().asSlice() },
      c: 2
    };
  }
}
