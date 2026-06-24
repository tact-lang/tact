struct OptionalNested {
  val: Int?;
  flag: Bool?;
  text: String?;
}

contract TestOptionalNested {
  state: OptionalNested;
  init() {
    self.state = OptionalNested{
      val: null,
      flag: true,
      text: "optional"
    };
  }
}