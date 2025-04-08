struct OptionalStruct {
  inner: Inner?;
}

struct Inner {
  val: Int;
}

contract OptStructField {
  s: OptionalStruct;

  init() {
    self.s = OptionalStruct { inner: null };
  }
}
