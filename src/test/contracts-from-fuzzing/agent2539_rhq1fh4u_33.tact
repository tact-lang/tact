struct Deep {
  a: Int;
}

struct Mid {
  d: Deep;
}

struct High {
  m: Mid;
}

contract DeepHierarchy {
  h: High;

  init() {
    self.h = High{m: Mid{d: Deep{a:99}}};
  }
}