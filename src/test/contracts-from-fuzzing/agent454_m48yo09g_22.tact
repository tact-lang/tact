struct HasString {
  t: String;
}

struct OptionalHasString {
  val: HasString?;
}

contract OptionalNestedString {
  field: OptionalHasString;
  init() {
    self.field = OptionalHasString{ val: null };
  }
}