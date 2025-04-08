struct Inner {
  a: Int;
}

struct Outer {
  b: Inner?;
}

contract Test {
  data: Outer;
  init() {
    self.data = Outer{
      b: Inner{a:1},
    };
  }
}