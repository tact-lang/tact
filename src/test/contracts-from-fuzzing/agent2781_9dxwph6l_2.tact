struct InnerMost {
  f: Int = 1;
  g: Bool = false;
}

struct Inner {
  x: Int?;       // optional without default
  y: InnerMost;  // nested struct with defaults
}

struct Outer {
  inner: Inner;  // nested struct with optional inside
}

contract Test {
  data: Outer = Outer{
    inner: Inner{
      x: null,
      y: InnerMost{},
    }
  };
}