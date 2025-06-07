struct RecA {
  a: RecB;
}
struct RecB {
  b: RecC;
}
struct RecC {
  c: RecD;
}
struct RecD {
  d: Int;
}

contract DeepRecursion {
  r: RecA;
  init() {
    self.r = RecA{ a:RecB{ b:RecC{ c:RecD{ d:42 } } } };
  }
}