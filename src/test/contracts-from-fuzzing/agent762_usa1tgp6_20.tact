struct Small {
  x: Int;
}

struct MiddleOpt {
  s: Small?;
}

contract OptSmallMiddle {
  data: MiddleOpt;

  init() {
    self.data = MiddleOpt { s: null };
  }
}