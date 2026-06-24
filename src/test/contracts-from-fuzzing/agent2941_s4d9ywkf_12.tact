struct OptionalInner {
  x: Int?;
}

struct OptionalMid {
  y: OptionalInner?;
}

struct OptionalOuter {
  z: OptionalMid?;
}

contract DeepOptionalNull {
  data: OptionalOuter;

  init() {
    self.data = OptionalOuter{
      z: null,
    };
  }
}