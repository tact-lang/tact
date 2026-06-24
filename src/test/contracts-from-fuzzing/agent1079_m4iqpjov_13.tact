struct OptNested {
  inner: Inner?;
}

struct Inner {
  str: String;
  boolFlag: Bool;
}

contract C {
  d: OptNested;

  init() {
    self.d = OptNested{
      inner: null
    };
  }
}