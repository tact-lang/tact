struct NestedOptionals {
  a: Int?;
  b: String?;
  c: Bool?;
}

struct OuterStruct {
  nested: NestedOptionals?;
}

contract NestedOptionalHolder {
  data: OuterStruct;

  init() {
    self.data = OuterStruct{
      nested: null
    };
  }
}