struct OptionalString {
  s: String?;
}

contract OptionalStringTest {
  field: OptionalString;
  init() {
    self.field = OptionalString{s:null};
  }
}