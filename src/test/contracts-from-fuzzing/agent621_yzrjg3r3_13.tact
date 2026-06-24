struct OptionalIntLayer {
  x: Int?;
  y: Int?;
  z: Int?;
}

struct LayeredOpt {
  inner: OptionalIntLayer?;
}

contract Test {
  val: LayeredOpt;

  init() {
    self.val = LayeredOpt{
      inner: null
    };
  }
}
