struct Inner {
  v: Int;
}

struct Outer {
  inner: Inner?;
  flag: Bool;
}

contract OptionalNestedStruct {
  data: Outer;

  init() {
    self.data = Outer{
      inner: null,
      flag: true
    };
  }
}
