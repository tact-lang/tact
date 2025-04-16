struct SubNested {
  inside1: Int;
  inside2: Bool?;
  inside3: String;
}

struct Nested {
  sub: SubNested;
  val: Bool;
}

contract OptionalNested {
  optionalNested: Nested?;

  init() {
    self.optionalNested = null;
  }
}
