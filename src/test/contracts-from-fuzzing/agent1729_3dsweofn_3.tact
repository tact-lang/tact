struct Deep {
  d1: Int;
  d2: Int?;
}

struct Mid {
  m: Deep;
  mval: Int;
}

struct Top {
  t: Mid;
  t2: Bool;
}

contract TestContract {
  data: Top;

  init() {
    self.data = Top{
      t: Mid{
        m: Deep{ d1: 2, d2: null },
        mval: 5,
      },
      t2: false,
    };
  }
}