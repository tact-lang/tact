// Deep nesting with mixed optionals and non-optionals
struct One {
  a: Int;
}

struct Two {
  b: One?;
}

struct Three {
  c: Two;
  d: Int?;
}

contract MixDeep {
  val: Three;
  init() {
    self.val = Three {
      c: Two { b: null },
      d: null
    };
  }
}