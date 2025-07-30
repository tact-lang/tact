struct DeepOptional {
  foo: Int?;
  bar: Bool?;
  str: String?;
  nested: NestedOpt?;
}

struct NestedOpt {
  baz: Int?;
  qux: String?;
}

contract TestDeepOptional {
  v: DeepOptional;

  init() {
    self.v = DeepOptional{
      foo:null, bar:null, str:null, nested:null
    };
  }
}
