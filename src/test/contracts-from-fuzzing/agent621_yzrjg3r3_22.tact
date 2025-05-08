struct OptionalWithString {
  a: Int?;
  b: String?;
}

contract Test {
  s: OptionalWithString;

  init() {
    self.s = OptionalWithString{
      a:null,
      b:"foo"
    };
  }
}
