struct Nested {
  val1: Int;
  val2: Bool;
  inner: DeepInner;
}

struct DeepInner {
  x: Int;
  y: Int?;
}

contract Test {
  state1: Int;
  state2: Nested;

  init() {
    self.state1 = 1;
    self.state2 = Nested{
      val1: 2,
      val2: true,
      inner: DeepInner{
        x: 3,
        y: null,
      },
    };
  }
}