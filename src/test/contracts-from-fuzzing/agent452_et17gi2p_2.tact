struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  inner: Inner;
  z: Bool;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{
        x: 10,
        y: null,
      },
      z: true,
    };
  }
}