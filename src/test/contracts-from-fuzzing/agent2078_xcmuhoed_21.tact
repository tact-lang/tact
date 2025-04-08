struct S1 {
  a: Int?;
  b: Int = 2;
}

struct S2 {
  s1: S1?;
  s1b: S1 = S1{ a: null, b: 3 };
}

contract NullCombo {
  f1: S1 = S1{ a: null, b: 5 };
  f2: S2 = S2{ s1: null, s1b: S1{ a: null, b: 7 } };
  init() {}
}