struct OptionalInner {
  val: Int?;
}

contract OptionalInStruct {
  s: OptionalInner;

  init() {
    self.s = OptionalInner{val: null};
  }
}