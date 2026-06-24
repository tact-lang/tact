struct OptInner {
  x: Int;
}

struct Outer {
  a: Int;
  b: OptInner?;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      a: 1,
      b: null,
    };
  }
}