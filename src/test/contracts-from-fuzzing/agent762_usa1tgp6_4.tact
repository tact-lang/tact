struct Inner {
  value: Int?;
}

struct Outer {
  inner: Inner;
  flag: Bool;
}

contract OptionalInNestedStruct {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{ value: null },
      flag: true
    };
  }
}