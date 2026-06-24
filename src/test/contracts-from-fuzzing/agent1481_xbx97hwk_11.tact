struct OptionalNested {
  x: InnerOptional?;
}

struct InnerOptional {
  y: Int?;
}

contract OptNestedTest {
  val: OptionalNested;
  init() {
    self.val = OptionalNested{ x: null };
  }
}