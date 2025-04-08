struct OptionalInner {
  val: Int?;
  comment: String?;
}

contract OptNested {
  optData: OptionalInner;

  init() {
    self.optData = OptionalInner{
      val: null,
      comment: null,
    };
  }
}