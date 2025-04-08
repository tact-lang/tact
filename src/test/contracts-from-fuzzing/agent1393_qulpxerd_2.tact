struct DeepNested {
  a: Int;
  b: Bool?;
}

struct Outer {
  x: Int;
  y: DeepNested;
}

contract Complex {
  data: Outer;

  init() {
    self.data = Outer{
      x: 1,
      y: DeepNested{
        a: 42,
        b: null,
      }
    };
  }
}
