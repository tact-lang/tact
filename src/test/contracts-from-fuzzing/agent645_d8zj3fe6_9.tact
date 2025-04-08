struct OptionalString {
  data: String?;
}

contract OptionalExample {
  s: OptionalString;

  init() {
    self.s = OptionalString{
      data: null
    };
  }
}
