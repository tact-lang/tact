struct Inner {
  a: Int;
  b: String;
  c: Bool;
}

struct Outer {
  x: Int;
  y: Inner;
  z: String;
}

contract DeepNest {
  data: Outer;

  init() {
    self.data = Outer{
      x: 1,
      y: Inner{ a: 2, b: "abc", c: true },
      z: "xyz"
    };
  }
}