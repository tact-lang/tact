struct MultiOptionalNest {
  a: Int?;
  b: Bool?;
  c: Nested?;
}

struct Nested {
  d: String?;
  e: Bool;
}

contract Test {
  field: MultiOptionalNest;

  init() {
    self.field = MultiOptionalNest{
      a: null,
      b: null,
      c: Nested{
        d: "x",
        e: true,
      },
    };
  }
}