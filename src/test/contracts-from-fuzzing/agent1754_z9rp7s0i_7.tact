struct OptionalStructs {
  nestedOpt: Nested?;
}

struct Nested {
  foo: Int;
  bar: Bool;
}

contract OptStructTest {
  val: OptionalStructs;
  init() {
    self.val = OptionalStructs{nestedOpt: null};
  }
}