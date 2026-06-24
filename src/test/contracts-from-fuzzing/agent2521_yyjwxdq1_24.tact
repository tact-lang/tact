struct Deep {
  val: Int as int128;
}

struct Mid {
  d1: Deep;
  d2: Deep;
}

struct Top {
  m1: Mid;
  m2: Mid;
}

contract SerialDeep {
  t: Top;

  init() {
    self.t = Top{
      m1: Mid{ d1: Deep{ val: 1024 }, d2: Deep{ val: -1024 } },
      m2: Mid{ d1: Deep{ val: 2048 }, d2: Deep{ val: -2048 } }
    };
  }
}
