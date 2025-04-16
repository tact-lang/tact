struct OptionalString {
  str: String?;
}
contract Test {
  s: OptionalString;
  init() {
    self.s = OptionalString{ str: null };
  }
}