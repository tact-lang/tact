struct NestedOptional {
  x: Int?;
  y: Bool?;
  z: String?;
}

contract TestContract {
  optNested: NestedOptional;

  init() {
    self.optNested = NestedOptional{ x: null, y: true, z: null };
  }
}