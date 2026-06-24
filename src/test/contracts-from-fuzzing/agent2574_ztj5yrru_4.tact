struct OptionalNest {
  inner: Int?;
  text: String?;
}

contract OptionFields {
  d: OptionalNest;

  init() {
    self.d = OptionalNest{ inner: null, text: null };
  }
}