struct Inner {
  x: Int;
  y: Bool?;
  z: String?;
}

struct Outer {
  i: Inner;
  j: Inner?;
}

contract DeepOptional {
  data: Outer;

  init() {
    self.data = Outer{
      i: Inner{x: 5, y: true, z: null},
      j: null
    };
  }
}
