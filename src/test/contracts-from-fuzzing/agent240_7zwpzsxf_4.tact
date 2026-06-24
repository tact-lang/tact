struct OptionalsStruct {
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
}

contract OptStorage {
  state: OptionalsStruct;

  init() {
    self.state = OptionalsStruct{
      opt1: 123,
      opt2: null,
      opt3: "hello",
    };
  }
}
