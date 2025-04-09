struct Inner {
  x: Int;
}

struct Middle {
  y: Int;
  z: Inner?;
}

struct Outer {
  inside: Middle?;
}

contract Test {
  data: Outer = Outer{
    inside: null,
  };

  init() {
    self.data = Outer{
      inside: null,
    };
  }
}