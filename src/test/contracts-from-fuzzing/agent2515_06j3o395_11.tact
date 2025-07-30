struct OptionalNested {
  foo: Int?;
  nested: NestedOptional?;
}

struct NestedOptional {
  bar: Bool?;
  deeper: Int?;
}

contract OptNestTest {
  field: OptionalNested;
  init() {
    self.field = OptionalNested{
      foo: null,
      nested: NestedOptional{
        bar: null,
        deeper: null
      }
    };
  }
}
