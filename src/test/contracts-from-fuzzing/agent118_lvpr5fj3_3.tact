struct Inner {
  a: Int;
  b: Int;
}

struct Outer {
  maybeInner: Inner?;
  flag: Bool;
}

contract OptionalNested {
  data: Outer;

  init() {
    self.data = Outer{
      maybeInner: null,
      flag: true
    };
  }
}