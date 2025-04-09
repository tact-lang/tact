struct OptionalNested {
  foo: Int?;
  bar: Nested?;
}

struct Nested {
  baz: String?;
}

contract Test {
  opt: OptionalNested;

  init() {
    self.opt = OptionalNested{
      foo: null,
      bar: Nested{baz:null},
    };
  }
}