struct SubNested {
  a: Int;
  b: Bool;
}

struct Nested {
  x: SubNested;
}

contract OptionalStructField {
  maybeNested: Nested?;

  init() {
    self.maybeNested = null;
  }
}