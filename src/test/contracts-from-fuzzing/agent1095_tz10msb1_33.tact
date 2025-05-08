struct OptionInStruct {
  x: Int?;
  y: Bool?;
  z: String;
}

contract OptContract {
  state: OptionInStruct?;

  init() {
    self.state = OptionInStruct{
      x: null,
      y: true,
      z: "hello"
    };
  }
}