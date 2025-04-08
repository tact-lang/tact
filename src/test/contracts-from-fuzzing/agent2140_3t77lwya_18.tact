// This will test nested optional structs with optionals inside

struct Inner {
  foo: Int?;
  bar: Bool?;
}

struct OuterOpt {
  nested: Inner?;
}

contract OptStructs {
  data: OuterOpt;
  init() {
    self.data = OuterOpt{ nested: null };
  }
}
