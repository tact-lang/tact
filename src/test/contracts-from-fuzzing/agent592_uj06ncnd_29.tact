struct InnerBool {
  f: Bool;
}

struct OuterOpt {
  inner: InnerBool?;
  other: Int;
}

contract OptWithinOpt {
  o: OuterOpt?;

  init() {
    self.o = null;
  }
}