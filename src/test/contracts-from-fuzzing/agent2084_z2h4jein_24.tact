struct Holder {
  val: String;
}

contract NullStruct {
  opt: Holder?;
  init() {
    self.opt = null;
  }
}
