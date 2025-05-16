struct Bottom {
  x: Int;
}

struct Mid {
  a: Bottom;
  b: Bottom;
}

struct Top {
  m1: Mid;
  m2: Mid;
}

contract MultiReuse {
  store: Top;

  init() {
    self.store = Top{
      m1: Mid{ a: Bottom{ x: 1 }, b: Bottom{ x: 2 } },
      m2: Mid{ a: Bottom{ x: 3 }, b: Bottom{ x: 4 } }
    };
  }
}