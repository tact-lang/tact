struct Inner {
  x: Int?;
}

struct Middle {
  inner: Inner;
  b: Bool = true;
}

contract NestedStructs {
  m: Middle;

  init() {
    self.m = Middle{ inner: Inner{} };
  }
}