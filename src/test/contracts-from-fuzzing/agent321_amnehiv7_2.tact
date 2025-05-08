struct Deep {
  a: Int?;
  b: Int;
}

struct Mid {
  c: Deep;
  d: Int?;
}

struct Top {
  e: Mid;
  f: Int?;
}

contract DeeplyNestedOptionals {
  data: Top;

  init() {
    self.data = Top{
      e: Mid{
        c: Deep{ a: null, b: 1 },
        d: null
      },
      f: null
    };
  }
}