struct OptionalStruct {
  inner: InnerStruct?;
}

struct InnerStruct {
  field: Int;
}

contract TestOptionalStruct {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct{ inner: null };
  }
}