struct OptionInMiddle {
  intVal: Int;
  flag: Bool?;
  strVal: String;
}

contract OptMiddleTest {
  m: OptionInMiddle;

  init() {
    self.m = OptionInMiddle{
      intVal: 1,
      flag: null,
      strVal: "hello"
    };
  }
}