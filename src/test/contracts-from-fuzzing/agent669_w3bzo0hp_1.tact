struct NestedStruct {
  a: Int;
  b: Bool;
  s: InnerStruct;
}

struct InnerStruct {
  x: Int;
  y: Int;
  z: Bool;
}

contract DeepContract {
  data: NestedStruct;

  init() {
    self.data = NestedStruct{
      a: 1,
      b: true,
      s: InnerStruct{
        x: 10,
        y: 20,
        z: false
      }
    };
  }
}
