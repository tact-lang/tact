struct InnerOpts {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

struct OuterOpts {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Int?;
  e: Bool?;
  f: String?;
  g: Int?;
  h: Bool?;
  nested: InnerOpts;
}

contract Test6 {
  val: OuterOpts;

  init() {
    self.val = OuterOpts{
      a: null,
      b: null,
      c: null,
      d: null,
      e: null,
      f: null,
      g: null,
      h: null,
      nested: InnerOpts{ foo: null, bar: null, baz: null },
    };
  }
}
