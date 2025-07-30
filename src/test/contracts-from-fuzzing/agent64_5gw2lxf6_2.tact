struct DeepNested {
  inner: InnerStruct;
}

struct InnerStruct {
  a: Int;
  b: Int;
}

contract TestContract {
  val: DeepNested;

  init() {
    self.val = DeepNested{ inner: InnerStruct{ a: 10, b: 20 } };
  }
}