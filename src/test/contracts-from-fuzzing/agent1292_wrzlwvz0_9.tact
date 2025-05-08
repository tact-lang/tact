struct NestedOptionalStruct {
  flag: Bool;
  inner: InnerStruct?;
}

struct InnerStruct {
  x: Int;
  y: Bool;
}

contract NestedOpt {
  data: NestedOptionalStruct;

  init() {
    self.data = NestedOptionalStruct {
      flag: true,
      inner: InnerStruct{ x: 4, y: false }
    };
  }
}