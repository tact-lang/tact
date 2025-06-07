struct One {
  val: Int;
}

struct Two {
  one: One;
}

struct Three {
  two: Two;
}

contract Chain3 {
  top: Three;

  init() {
    self.top = Three{ two: Two{ one: One{ val: 99 } } };
  }
}
