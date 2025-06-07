struct DeepOptional {
  val: Int?;
  optStr: String?;
  optAddr: Address?;
}

struct WrappingDeepOptional {
  inner: DeepOptional?;
}

contract DeeplyOptional {
  container: WrappingDeepOptional;

  init() {
    self.container = WrappingDeepOptional{
      inner: null
    };
  }
}
