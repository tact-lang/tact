struct OptionalNest {
  innerOpt: Inner?;
}

struct Inner {
  x: Int;
  y: String?;
}

contract TestContract {
  state: OptionalNest;

  init() {
    self.state = OptionalNest{ innerOpt: null };
  }
}