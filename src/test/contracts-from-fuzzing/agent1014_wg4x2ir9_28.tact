struct P {
  x: Int?;
}

struct Q {
  p: P?;
}

struct R {
  q: Q?;
}

contract C {
  nested: R = R{ q: null };
}
