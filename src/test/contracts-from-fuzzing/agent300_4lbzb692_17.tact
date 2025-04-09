struct Third {
  v: Int;
}

struct Second {
  t: Third;
}

struct First {
  s: Second;
}

contract Test {
  f: First;
  init() {
    self.f = First { s: Second { t: Third { v: 1 } } };
  }
}