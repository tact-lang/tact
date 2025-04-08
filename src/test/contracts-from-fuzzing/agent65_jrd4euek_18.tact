struct NestedStruct1 {
  f1: Int;
}

struct NestedStruct2 {
  inner: NestedStruct1;
}

struct NestedStruct3 {
  inner: NestedStruct2;
}

contract MultilayerOpt {
  wrap: NestedStruct3?;
  init() {
    self.wrap = null;
  }
}