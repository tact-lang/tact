struct OptionalBool {
  flag: Bool?;
}

contract NullableBool {
  data: OptionalBool;

  init() {
    self.data = OptionalBool{
      flag: null
    };
  }
}
