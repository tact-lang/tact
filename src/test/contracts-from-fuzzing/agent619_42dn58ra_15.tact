struct Complex {
  a: Int;
  b: Bool;
  c: String?;
  d: Address?;
}

contract OptInStruct {
  val: Complex?;

  init() {
    self.val = null;
  }
}
