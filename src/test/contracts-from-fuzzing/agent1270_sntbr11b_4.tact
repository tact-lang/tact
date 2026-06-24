struct P {
  p1: Int;
  p2: Bool;
}

struct Q {
  q1: Int;
  q2: P;
}

struct R {
  r1: Bool;
  r2: Q;
}

contract MultiNested {
  nested: R = R{
    r1: true,
    r2: Q{
      q1: 42,
      q2: P{
        p1: 7,
        p2: false
      }
    }
  };
}