struct L2 {
  x: Int?;
}

struct L1 {
  a: L2?;
}

contract OptInOptNest {
  f: L1?;

  init() {
    self.f = null;
  }
}