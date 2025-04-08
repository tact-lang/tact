struct InnerStruct {
  a: Int;
  b: Bool;
}

struct OuterStruct {
  inner: InnerStruct;
  y: Int;
}

contract TestContract {
  data: OuterStruct;

  init() {
    self.data = OuterStruct{
      inner: InnerStruct{ a: 1, b: true },
      y: 42,
    };
  }
}
