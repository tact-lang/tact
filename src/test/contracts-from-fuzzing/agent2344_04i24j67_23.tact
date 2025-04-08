struct OptionalString {
  name: String?;
  caption: String?;
}

contract TestOptionalString {
  s: OptionalString;

  init() {
    self.s = OptionalString{
      name: null,
      caption: null,
    };
  }
}