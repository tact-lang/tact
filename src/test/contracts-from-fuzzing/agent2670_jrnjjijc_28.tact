struct OptionalBool {
  b: Bool?;
}

contract WrappedOptionalBool {
  field: OptionalBool;

  init() {
    self.field = OptionalBool{ b: null };
  }
}