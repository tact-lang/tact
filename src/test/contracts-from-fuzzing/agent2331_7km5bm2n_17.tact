struct DeepOpt {
  innerOpt: Inner?;
}

struct Inner {
  val: Int;
}

contract Test {
  s: DeepOpt;
  init() {
    self.s = DeepOpt{innerOpt:null};
  }
}