struct OptionalNested {
  val: Int?;
  text: String?;
}

contract OptionalFields {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      val: null,
      text: null,
    };
  }
}