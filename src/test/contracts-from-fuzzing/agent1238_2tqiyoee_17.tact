struct LargeNesting {
  l1: Level1;
  l2: Level2;
  l3: Level3;
}

struct Level1 {
  a: Int;
}

struct Level2 {
  b: Level1;
}

struct Level3 {
  c: Level2;
}

contract MultiStructDeepTest {
  val: LargeNesting;

  init() {
    self.val = LargeNesting{
      l1: Level1{ a: 5 },
      l2: Level2{ b: Level1{ a: 6 } },
      l3: Level3{ c: Level2 { b: Level1 { a: 7 } } }
    };
  }
}