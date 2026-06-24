struct OptionalString {
  a: String?;
}

contract OptStringTest {
  s: OptionalString;

  init() {
    self.s = OptionalString{a:null};
  }
}