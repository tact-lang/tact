struct InnerDef {
  x: Int = 1;
}

struct OuterDef {
  inner: InnerDef;
}

contract DefaultInnerStruct {
  data: OuterDef;

  init() {
    self.data = OuterDef{ inner: InnerDef{} };
  }
}