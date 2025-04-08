struct InnerStr {
  flag: Bool;
  txt: String;
}

contract OptStruct {
  val: InnerStr?;

  init() {
    self.val = null;
  }
}