struct InnerNested {
  a: Int;
  b: Bool?;
}

struct OuterNested {
  x: Int;
  y: InnerNested;
  z: String?;
}

contract DeepNestedContract {
  field1: Int;
  field2: OuterNested;
  
  init() {
    self.field1 = 1;
    self.field2 = OuterNested{
      x: 2,
      y: InnerNested{
        a: 3,
        b: true,
      },
      z: "nest",
    };
  }
}
