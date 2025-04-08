struct OptionalStruct {
  foo: Inner?;
}

struct Inner {
  v1: Int;
  v2: Bool;
  v3: String?;
}

contract OptStructField {
  data: OptionalStruct;
  init() {
    self.data = OptionalStruct{ foo: null };
  }
}
