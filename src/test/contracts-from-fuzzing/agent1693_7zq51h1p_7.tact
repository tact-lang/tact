struct DeepOptionalInner {
  name: String?;
  flag: Bool?;
}

struct DeepOptionalOuter {
  inner: DeepOptionalInner?;
  age: Int?;
}

contract DeepOptionalContract {
  param: DeepOptionalOuter;

  init() {
    self.param = DeepOptionalOuter{
      inner: null,
      age: null
    };
  }
}