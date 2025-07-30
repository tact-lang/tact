struct OptionalString {
  s: String?;
  b: Bool;
}

contract TestContract {
  fld: OptionalString;

  init() {
    self.fld = OptionalString{
      s: "hello",
      b: true,
    };
  }
}
