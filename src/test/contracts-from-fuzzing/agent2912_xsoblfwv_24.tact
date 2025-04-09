struct NestedRem {
  a: Int;
  rest: Slice as remaining;
}

struct OuterRem {
  inner: NestedRem;
}

contract NestedRemaining {
  s: OuterRem;
  init() {
    self.s = OuterRem{ inner: NestedRem{ a:1, rest: emptyCell().asSlice() } };
  }
}