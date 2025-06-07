struct Nested {
  inner1: Int;
  inner2: Bool;
}

contract DeepOptionalNested {
  nestedOpt: Nested?;

  init() {
    self.nestedOpt = null;
  }
}