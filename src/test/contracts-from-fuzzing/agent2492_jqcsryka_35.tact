struct DeepOpt {
  val: Int?;
}

contract NestedOpt2Structs {
  f: DeepOpt;

  init() {
    self.f = DeepOpt{val: null};
  }
}