struct Small {
  a: Int;
}

struct Medium {
  a: Small;
  b: Small;
  c: Small;
}

struct Large {
  a: Medium;
  b: Medium;
  c: Medium;
}

contract NestedMany {
  data: Large;

  init() {
    self.data = Large{
      a: Medium{
        a: Small{a: 1},
        b: Small{a: 2},
        c: Small{a: 3},
      },
      b: Medium{
        a: Small{a: 4},
        b: Small{a: 5},
        c: Small{a: 6},
      },
      c: Medium{
        a: Small{a: 7},
        b: Small{a: 8},
        c: Small{a: 9},
      }
    };
  }
}
