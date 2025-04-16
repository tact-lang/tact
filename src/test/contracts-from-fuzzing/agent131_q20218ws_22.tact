struct InnerMost {
  c: Int;
}

struct Middle {
  b: InnerMost;
}

struct Top {
  a: Middle;
}

contract NullNestedDeep {
  s: Top?;

  init() {
    self.s = null;
  }
}