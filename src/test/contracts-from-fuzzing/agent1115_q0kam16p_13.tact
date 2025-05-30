// test of contract with nested struct, one optional, one non-optional
struct Inner {
  n: Int;
}

struct Outer {
  optInner: Inner?;
  alwaysThere: Int;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      optInner: null,
      alwaysThere: 55
    };
  }
}