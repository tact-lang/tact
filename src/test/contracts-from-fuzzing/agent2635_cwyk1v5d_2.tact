struct Deep {
  n1: Int;
  n2: Int?;
  n3: Int;
}

struct Mid {
  m1: Deep;
  m2: Int?;
}

struct Top {
  t1: Mid;
  t2: Int;
}

contract StorageDeepNest {
  deepData: Top;

  init() {
    self.deepData = Top{
      t1: Mid{
        m1: Deep{ n1: 1, n2: null, n3: 3 },
        m2: null
      },
      t2: 42
    };
  }
}