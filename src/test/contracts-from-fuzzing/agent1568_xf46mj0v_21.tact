struct InnerOpt {
  val: Int?;
}

contract OptionalSerialize {
  opt: InnerOpt;

  init() {
    self.opt = InnerOpt{val: null};
  }
}