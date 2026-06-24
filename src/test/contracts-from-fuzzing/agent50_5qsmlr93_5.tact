struct Level3 {
  deep: Int;
}

struct Level2 {
  lvl3: Level3;
  maybe: Int?;
}

struct Level1 {
  num: Int;
  lvl2: Level2;
}

contract Test {
  nested: Level1;

  init() {
    self.nested = Level1{
      num: 10,
      lvl2: Level2{
        lvl3: Level3{ deep: 999 },
        maybe: null,
      },
    };
  }
}