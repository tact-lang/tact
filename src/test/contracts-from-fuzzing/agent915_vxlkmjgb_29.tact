struct S1 {
  a: Int;
}

struct S2 {
  one: S1;
  two: S1;
}

contract NestedAssigned {
  store: S2;

  init() {
    self.store = S2{
      one: S1{ a: 1 },
      two: S1{ a: 2 }
    };
  }
}
