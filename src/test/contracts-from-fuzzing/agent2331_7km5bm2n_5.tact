struct OptionalNested {
  maybeInt: Int?;
  maybeString: String?;
}

contract Test {
  x: OptionalNested;
  init() {
    self.x = OptionalNested{maybeInt: null, maybeString: null};
  }
}