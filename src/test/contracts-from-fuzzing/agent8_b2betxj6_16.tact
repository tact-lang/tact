struct DeepOptional {
  inner: Int?;
}

struct MiddleOptional {
  o: DeepOptional?;
}

contract TwiceOptional {
  data: MiddleOptional;

  init() {
    self.data = MiddleOptional{ o: null };
  }
}