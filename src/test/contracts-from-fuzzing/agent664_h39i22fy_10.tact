struct Mid {
  d: Int;
  e: Bool;
  f: String?;
}

struct Top {
  a: Int;
  b: Bool;
  c: Mid;
}

contract Test {
  record: Top;

  init() {
    self.record = Top{
      a: 99,
      b: false,
      c: Mid{
        d: 123,
        e: true,
        f: null,
      },
    };
  }
}