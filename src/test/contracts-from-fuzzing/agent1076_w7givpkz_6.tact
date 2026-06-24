struct OptionalNest {
  innerOpt: Inner?;
}

struct Inner {
  val: Int;
  flag: Bool;
}

contract OptionalDeep {
  data: OptionalNest;

  init() {
    self.data = OptionalNest{innerOpt: Inner{val: 5, flag: false}};
  }
}
