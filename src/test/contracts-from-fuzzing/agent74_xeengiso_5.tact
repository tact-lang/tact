struct OptionalNested {
  inner: Inner?;
  flag: Bool?;
}

struct Inner {
  x: Int;
  y: Int;
}

contract TestContract {
  data: OptionalNested;
  init() {
    self.data = OptionalNested{
      inner: null,
      flag: null,
    };
  }
}