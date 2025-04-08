struct Inner {
  val: Int;
}

struct Outer {
  innerOpt: Inner?;
}

contract OptionalStructField {
  wrapper: Outer;

  init() {
    self.wrapper = Outer{innerOpt: null};
  }
}