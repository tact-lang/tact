struct NestedA {
  a: Int;
}

struct NestedB {
  b: Int;
}

struct NestedC {
  c: Int;
}

struct Massive {
  na: NestedA;
  nb: NestedB;
  nc: NestedC;
}

contract TestContract {
  m: Massive;

  init() {
    self.m = Massive{
      na: NestedA{a: 1},
      nb: NestedB{b: 2},
      nc: NestedC{c: 3}
    };
  }
}