struct NestedMultiple {
  n1: NestedOne;
  n2: NestedTwo;
}

struct NestedOne {
  x: Int;
  text: String;
}

struct NestedTwo {
  y: Int;
  flag: Bool;
}

contract MultiNested {
  f: NestedMultiple;

  init() {
    self.f = NestedMultiple {
      n1: NestedOne { x: 1, text: "a" },
      n2: NestedTwo { y: 2, flag: true }
    };
  }
}