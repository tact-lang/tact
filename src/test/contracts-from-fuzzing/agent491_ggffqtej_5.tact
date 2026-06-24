struct NestedOptional {
  innerOpt: OptionalStruct?;
}

struct OptionalStruct {
  foo: Int?;
  bar: Bool?;
}

contract OptionalNestedTest {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{ innerOpt: null };
  }
}
