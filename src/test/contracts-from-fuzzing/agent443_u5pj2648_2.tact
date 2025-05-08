struct OptionalInner {
  a: Int?;
  b: String?;
}

contract WithOptionalNested {
  data: OptionalInner;

  init() {
    self.data = OptionalInner{a: null, b: null};
  }
}