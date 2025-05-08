struct One {
  a: Int;
}

struct Two {
  b: One;
}

struct Three {
  c: Two;
}

struct Four {
  d: Three;
}

contract NestedFour {
  deep: Four;

  init() {
    self.deep = Four{ d: Three{ c: Two{ b: One{a:123} } } };
  }
}