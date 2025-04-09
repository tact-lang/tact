struct NestedTail {
  f: Int;
  rem: Slice as remaining;
}

struct Wrap {
  nested: NestedTail;
  id: Int;
}

contract WrapRem {
  data: Wrap;
  init() {
    self.data = Wrap{nested: NestedTail{f:1,rem:emptyCell().asSlice()}, id: 99};
  }
}