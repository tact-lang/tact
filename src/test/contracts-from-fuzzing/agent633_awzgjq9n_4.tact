struct OptionalNested {
  x: Int?;
  y: Bool?;
}

contract OptionalNestedContract {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{ x: null, y: true };
  }
}
