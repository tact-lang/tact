struct DeepOptStruct {
  opt1: Int?;
  opt2: String?;
  opt3: Bool?;
}

contract ComplexOptionals {
  data: DeepOptStruct;

  init() {
    self.data = DeepOptStruct{
      opt1: null,
      opt2: "hello",
      opt3: true
    };
  }
}