struct OptNested {
  innerValue: Int?;
  innerBool: Bool?;
  innerString: String?;
}

contract OptionalStructTest {
  data: OptNested;

  init() {
    self.data = OptNested{
      innerValue: null,
      innerBool: true,
      innerString: null
    };
  }
}