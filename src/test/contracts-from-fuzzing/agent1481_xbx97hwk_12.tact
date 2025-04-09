struct OptionalNested {
  x: InnerOptional?;
}

struct InnerOptional {
  y: Int?;
}

contract OptNestedTest2 {
  val: OptionalNested;
  init() {
    self.val = OptionalNested{ x: InnerOptional{ y: null } };
  }
}