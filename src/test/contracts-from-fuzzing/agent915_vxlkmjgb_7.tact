struct DeepOptionals {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

struct Enclosing {
  inner: DeepOptionals;
  flag: Bool;
  count: Int;
}

contract NestedOptFields {
  data: Enclosing;

  init() {
    self.data = Enclosing{
      inner: DeepOptionals{ foo: null, bar: true, baz: "hi" },
      flag: false,
      count: 777
    };
  }
}
