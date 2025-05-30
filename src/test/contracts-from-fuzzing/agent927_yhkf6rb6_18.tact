struct OptionalLayer2 {
  a: Int?;
  b: OptionalLayer1?;
}

struct OptionalLayer1 {
  x: Int?;
  y: String?;
}

contract OptLayerTest {
  storage: OptionalLayer2;

  init() {
    self.storage = OptionalLayer2{
      a: null,
      b: OptionalLayer1{
        x: null,
        y: null
      }
    };
  }
}