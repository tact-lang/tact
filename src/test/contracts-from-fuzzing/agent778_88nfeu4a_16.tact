struct S1 {
  f: Int;
}

struct S2 {
  s: S1;
}

contract ReassignNestedStruct {
  x: S2 = S2{ s: S1{f:1} };

  init() {
    self.x = S2{ s: S1{f:5} };
  }
}