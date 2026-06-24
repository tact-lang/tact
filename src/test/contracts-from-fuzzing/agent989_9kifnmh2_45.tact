struct NestedInner {
  f1: Int;
}
struct NestedOuter {
  f2: NestedInner;
}

contract NestedInit {
  foo: NestedOuter;
  init() {
    self.foo = NestedOuter{ f2: NestedInner{ f1: 9 } };
  }
}