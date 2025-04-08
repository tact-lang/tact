struct BoolIntString {
  b: Bool;
  i: Int;
  s: String;
}

contract BISMixTest {
  s: BoolIntString;

  init() {
    self.s = BoolIntString{
      b: true,
      i: 42,
      s: "test"
    };
  }
}