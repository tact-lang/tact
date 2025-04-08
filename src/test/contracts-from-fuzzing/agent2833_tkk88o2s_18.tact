struct NestedOpts {
  foo: Int?;
  bar: Bool?;
  sub: InnerOpts;
}

struct InnerOpts {
  baz: Int?;
  qux: String?;
}

contract DeepStructs {
  stuff: NestedOpts;

  init() {
    self.stuff = NestedOpts{
      foo: null,
      bar: null,
      sub: InnerOpts{
        baz: null,
        qux: null
      }
    };
  }
}