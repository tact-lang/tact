struct HasOptional {
  foo: Int?;
  bar: Bool?;
  nested: NestedOpt?;
}

struct NestedOpt {
  s: String?;
  i: Int;
}

contract TestContract {
  data: HasOptional;

  init() {
    self.data = HasOptional{
      foo: null,
      bar: true,
      nested: NestedOpt{
        s: null,
        i: 42
      }
    };
  }
}