struct OptionalInner {
  x: Int?;
  y: String?;
}

contract OptionalState {
  val: OptionalInner;

  init() {
    self.val = OptionalInner{
      x: null,
      y: "hello",
    };
  }
}
