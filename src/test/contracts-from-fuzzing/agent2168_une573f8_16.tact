struct Inner {
  a: Int;
  b: Int? = null;
  c: Bool = true;
}

struct Outer {
  x: Inner;
  y: Int = 5;
}

contract PartialNestedDefaults {
  data: Outer;

  init() {
    self.data = Outer{
      x: Inner{
        a: 42 // omit b (default null) and c (default true)
      }
      // omit y, should default to 5
    };
  }
}