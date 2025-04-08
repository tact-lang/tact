struct MultiOptional {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract Test {
  data: MultiOptional;

  init() {
    self.data = MultiOptional{
      foo: null,
      bar: true,
      baz: null,
    };
  }
}
