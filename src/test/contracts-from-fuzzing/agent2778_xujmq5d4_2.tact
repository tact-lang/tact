struct NestedOptional {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

struct WithNestedOpt {
  nested: NestedOptional;
}

contract WithNestedOptContract {
  data: WithNestedOpt;

  init() {
    self.data = WithNestedOpt{
      nested: NestedOptional{
        foo: null,
        bar: null,
        baz: null,
      }
    };
  }
}
