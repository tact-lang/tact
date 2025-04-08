struct WrapWrap {
  a: Int;
  b: Int?;
}
struct OuterWrap {
  inner: WrapWrap;
}

contract NestedOptionals {
  s: OuterWrap;

  init() {
    self.s = OuterWrap{ inner: WrapWrap{ a: 1, b: null } };
  }
}