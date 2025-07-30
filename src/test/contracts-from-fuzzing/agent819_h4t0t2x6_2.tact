struct Inner {
  val: Int;
}

struct Outer {
  innerOpt: Inner?;
}

contract TestContract {
  storage: Outer;

  init() {
    self.storage = Outer{ innerOpt: null };
  }
}