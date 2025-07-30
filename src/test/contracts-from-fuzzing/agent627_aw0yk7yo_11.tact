struct Deep {
  a: Int;
  b: Middle;
}

struct Middle {
  c: Int;
  d: Lower;
}

struct Lower {
  e: Int;
  f: Bottom;
}

struct Bottom {
  g: Int;
}

contract TestContract {
  field: Deep;
  init() {
    self.field = Deep{
      a: 1,
      b: Middle{
        c: 2,
        d: Lower{
          e: 3,
          f: Bottom{ g: 4 }
        }
      }
    };
  }
}