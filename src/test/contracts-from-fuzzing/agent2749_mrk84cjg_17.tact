struct S1 {
  s: String?;
}

struct S2 {
  inner: S1?;
}

contract OptNestLevels {
  nested: S2?;

  init() {
    self.nested = null;
  }
}