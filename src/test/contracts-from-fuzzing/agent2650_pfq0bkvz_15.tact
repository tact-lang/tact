struct InnerMost {
  a: Int;
}

struct Inner {
  ai: Int;
  nested: InnerMost;
}

struct Outer {
  x: Int;
  y: Inner;
}

contract StorageTest {
  data: Outer;

  init() {
    self.data = Outer{
      x: 5,
      y: Inner{
        ai: 3,
        nested: InnerMost{ a: 1 }
      }
    };
  }
}