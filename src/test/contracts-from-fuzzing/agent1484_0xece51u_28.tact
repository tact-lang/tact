struct Level3 {
  c: Int;
}

struct Level2 {
  b: Level3;
}

struct Level1 {
  a: Level2;
}

contract ChangeDeepField {
  s: Level1;

  init() {
    self.s = Level1{ a: Level2{ b: Level3{c: 5} } };
  }

  receive() {
    let old = self.s;
    self.s = Level1{ a: Level2{ b: Level3{ c: old.a.b.c + 1 } } };
  }
}