struct OptionWithString {
  s: String?;
}

contract OptionStringTest {
  val: OptionWithString;

  init() {
    self.val = OptionWithString{
      s: null
    };
  }
}