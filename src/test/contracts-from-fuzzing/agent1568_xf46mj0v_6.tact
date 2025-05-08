struct Inner {
  a: Int;
}

struct Middle {
  innerOpt: Inner?;
}

struct Outer {
  middleOpt: Middle?;
}

contract NullLayers {
  val: Outer;

  init() {
    self.val = Outer{
      middleOpt: null,
    };
  }
}