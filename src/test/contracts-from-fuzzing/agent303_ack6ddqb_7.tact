struct Inner {
  a: Int;
  b: String;
  c: Bool;
}

struct Outer {
  x: Inner;
  y: Int;
  z: Bool;
}

contract MultiLevel {
  data: Outer;
  init() {
    self.data = Outer{
      x: Inner{ a: 10, b: "x", c: true },
      y: 20,
      z: false
    };
  }
}
