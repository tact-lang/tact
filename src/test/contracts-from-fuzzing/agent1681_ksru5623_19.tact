struct NestedManyFields {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

struct Container {
  f1: NestedManyFields;
  f2: NestedManyFields;
}

contract DoubleNested {
  x: Container;
  init() {
    self.x = Container {
      f1: NestedManyFields{a:null,b:null,c:null,d:null},
      f2: NestedManyFields{a:null,b:null,c:null,d:null}
    };
  }
}
