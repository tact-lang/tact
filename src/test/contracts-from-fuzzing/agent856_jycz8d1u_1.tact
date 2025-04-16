struct InnerStruct {
  foo: Int;
  bar: Bool;
}

struct OuterStruct {
  nested: InnerStruct;
  flag: Bool;
}

contract NestedStructStorage {
  store: OuterStruct;

  init() {
    self.store = OuterStruct{
      nested: InnerStruct{ foo: 1, bar: true },
      flag: false
    };
  }
}