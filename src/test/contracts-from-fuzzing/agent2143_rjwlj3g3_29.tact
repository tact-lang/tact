struct OptionalString {
  name: String?;
}

contract OptionalStringStorage {
  val: OptionalString;

  init() {
    self.val = OptionalString{name: null};
  }
}