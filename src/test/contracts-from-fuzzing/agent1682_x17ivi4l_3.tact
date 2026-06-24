struct NestedOptional {
  foo: Int?;
  bar: Bool?;
  baz: String?;
  deep: Inner?;
}

struct Inner {
  a: Int;
}

contract TestContract {
  data: NestedOptional;

  init() {
    self.data = NestedOptional{
      foo: null,
      bar: true,
      baz: null,
      deep: null,
    };
  }
}