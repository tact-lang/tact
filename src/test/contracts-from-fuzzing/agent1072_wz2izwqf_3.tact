struct DeepInner {
  x: Int;
  y: Bool?;
}

struct MidLayer {
  foo: DeepInner?;
  bar: String;
}

struct TopLayer {
  a: MidLayer?;
  b: Int;
}

contract DeepOptionalTest {
  payload: TopLayer;

  init() {
    self.payload = TopLayer{
      a: null,
      b: 110
    };
  }
}
