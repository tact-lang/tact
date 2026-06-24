// test contract with optional nested struct
struct InnerNested {
  f1: Int;
  f2: Bool;
}

struct OuterNested {
  inner: InnerNested?;
  flag: Bool;
}

contract OptionalNestedStruct {
  storage: OuterNested;

  init() {
    self.storage = OuterNested{
      inner: null,
      flag: true,
    };
  }
}