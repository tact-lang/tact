struct Inner {
  foo: Int;
  bar: Bool?;
  baz: String?;
}

struct Outer {
  inr: Inner?;
  name: String;
}

contract OptionalNestedFields {
  data: Outer;
  
  init() {
    self.data = Outer{
      inr: null,
      name: "Test",
    };
  }
}
