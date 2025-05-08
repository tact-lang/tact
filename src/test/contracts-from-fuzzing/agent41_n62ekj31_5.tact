struct NestedOptional {
  opt: Int?;
}

struct Complex {
  nested: NestedOptional?;
}

contract Test {
  c: Complex;

  init() {
    self.c = Complex{ nested: null };
  }
}