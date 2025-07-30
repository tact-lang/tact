struct Nested {
  inner: InnerStruct?;
}

struct InnerStruct {
  foo: Int;
  bar: Bool?;
  baz: Address;
}

contract TestStore {
  s: Nested;

  init() {
    self.s = Nested{
      inner: InnerStruct{ foo: 1, bar: null, baz: myAddress() }
    };
  }
}
