struct Small {
  i: Int;
}

struct Mid {
  s1: Small;
  s2: Small;
  s3: Small;
  s4: Small;
  s5: Small;
}

struct Big {
  m1: Mid;
  m2: Mid;
}

contract NestedMultiUsed {
  f: Big;

  init() {
    self.f = Big{
      m1: Mid{
        s1: Small{ i: 1 },
        s2: Small{ i: 2 },
        s3: Small{ i: 3 },
        s4: Small{ i: 4 },
        s5: Small{ i: 5 }
      },
      m2: Mid{
        s1: Small{ i: 6 },
        s2: Small{ i: 7 },
        s3: Small{ i: 8 },
        s4: Small{ i: 9 },
        s5: Small{ i: 10 }
      }
    };
  }
}
