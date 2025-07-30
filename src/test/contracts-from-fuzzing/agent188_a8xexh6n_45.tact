struct InnerStr {
  str: String;
}

contract PersistentStringNested {
  val: InnerStr;

  init() {
    self.val = InnerStr { str: "test" };
  }
}