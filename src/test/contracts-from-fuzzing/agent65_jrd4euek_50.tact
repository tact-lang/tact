struct SubPartial {
  a: Int? = null;
  b: Bool? = null;
}

contract WeirdMix {
  val: SubPartial?;
  init() {
    self.val = null;
  }
}