struct X {
  x: Int?
}

struct Y {
  y: String?
}

contract DiffOpt {
  a: X?;
  b: Y?;

  init() {
    self.a = null;
    self.b = null;
  }
}
