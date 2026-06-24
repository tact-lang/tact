struct OptDeeper {
  s: OptDeep?;
}

struct OptDeep {
  s: Inner?;
}

struct Inner {
  x: Int?;
}

contract NullDeepChain {
  d: OptDeeper;

  init() {
    self.d = OptDeeper{ s: null };
  }
}