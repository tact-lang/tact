struct OptionalNested {
  optInt: Int?;
  optBool: Bool?;
  name: String;
}

contract TestOptionalNested {
  nested: OptionalNested;

  init() {
    self.nested = OptionalNested{
      optInt: null,
      optBool: true,
      name: "Test"
    };
  }
}