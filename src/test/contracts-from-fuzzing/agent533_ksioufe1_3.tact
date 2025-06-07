struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  z: Int?;
  inner: Inner?;
}

contract OptionNest {
  val: Outer;

  init() {
    self.val = Outer{
      z: null,
      inner: null
    };
  }
}
