struct OptionalNested {
  s: Inner?;
}

struct Inner {
  x: Int;
  y: Bool?;
}

contract OptionalNestedField {
  f: OptionalNested;

  init() {
    self.f = OptionalNested{
      s: Inner{ x: 42, y: null }
    };
  }
}