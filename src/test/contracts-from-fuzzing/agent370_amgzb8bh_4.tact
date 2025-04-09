struct DeepOptional {
  x: Int?;
  y: Bool?;
  z: String?;
}

struct Container {
  d1: DeepOptional?;
  d2: DeepOptional?;
}

contract OptionalInOptional {
  payload: Container;

  init() {
    self.payload = Container{
      d1: null,
      d2: null
    };
  }
}