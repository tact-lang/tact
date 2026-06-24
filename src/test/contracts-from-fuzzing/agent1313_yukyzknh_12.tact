struct NestedOptional {
  x: Int?;
  y: String?;
}

contract OptionalStructFields {
  s: NestedOptional?;

  init() {
    self.s = NestedOptional{x: null, y: "y"};
  }
}