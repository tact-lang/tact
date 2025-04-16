struct NestedStruct {
  field1: Int;
  field2: Bool?;
  field3: InnerStruct;
}

struct InnerStruct {
  a: Bool;
  b: String;
}

contract TestContract {
  ns: NestedStruct;

  init() {
    self.ns = NestedStruct{
      field1: 2,
      field2: true,
      field3: InnerStruct{
        a: false,
        b: "hello"
      }
    };
  }
}
