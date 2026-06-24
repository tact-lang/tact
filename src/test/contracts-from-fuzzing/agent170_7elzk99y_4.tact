struct OptionStruct {
  a: Int?;
  b: String?;
  c: Address?;
}

contract OptTest {
  val: OptionStruct;

  init() {
    self.val = OptionStruct{
      a: null,
      b: null,
      c: null
    };
  }
}