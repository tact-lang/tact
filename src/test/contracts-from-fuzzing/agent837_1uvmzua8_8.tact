struct InnerOpt {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract OptionalStructField {
  val: InnerOpt;

  init() {
    self.val = InnerOpt{
      x: null,
      y: null,
      z: null,
    };
  }
}