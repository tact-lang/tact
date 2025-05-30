struct OptionalNestLevel {
  foo: Int?;
  bar: String?;
  deeper: AnotherNested?;
}

struct AnotherNested {
  value: Bool;
}

contract TestOptionalNesting {
  data: OptionalNestLevel;

  init() {
    self.data = OptionalNestLevel{
      foo: null,
      bar: "hello",
      deeper: AnotherNested{
        value: true,
      },
    };
  }
}