struct OptionalNested {
  innermost: Int?;
}

struct Top {
  nested: OptionalNested?;
}

contract OptionNestedTest {
  data: Top;
  init() {
    self.data = Top{nested: null};
  }
}