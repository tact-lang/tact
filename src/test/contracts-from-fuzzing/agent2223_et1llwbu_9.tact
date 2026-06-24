struct Inner1 {
  val: Int;
}

struct Inner2 {
  val: Inner1;
}

contract OptionalOuter {
  innerOpt: Inner2?;

  init() {
    self.innerOpt = null;
  }
}