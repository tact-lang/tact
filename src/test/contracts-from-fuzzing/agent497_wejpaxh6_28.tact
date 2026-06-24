struct InnerOpt {
  val: Int?;
}

contract TestContract {
  io1: InnerOpt;
  io2: InnerOpt?;

  init() {
    self.io1 = InnerOpt{val:null};
    self.io2 = null;
  }
}