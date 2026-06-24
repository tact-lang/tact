struct IntAndOpt {
  regular: Int;
  opt1: Int?;
  opt2: Int?;
  opt3: Int?;
}

contract ComboTest {
  data: IntAndOpt;

  init() {
    self.data = IntAndOpt{
      regular: 123,
      opt1: 1,
      opt2: null,
      opt3: 3
    };
  }
}