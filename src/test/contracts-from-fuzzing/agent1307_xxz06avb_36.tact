struct Level3 {
  foo: Int;
}

struct Level2 {
  nested: Level3;
}

struct Level1 {
  n: Level2;
}

contract StructsInStructs {
  s: Level1 = Level1{ n: Level2{ nested: Level3{ foo: 0 } } };

  init() {
     self.s = Level1{ n: Level2{ nested: Level3{ foo: 777 } } };
  }
}