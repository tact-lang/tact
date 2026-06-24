struct DeepOpt {
  innermost: Int;
}

struct MiddleOpt {
  inner: DeepOpt?;
}

struct OuterOpt {
  middle: MiddleOpt?;
}

contract TestContract {
  data: OuterOpt;

  init() {
    self.data = OuterOpt { middle: null };
  }
}