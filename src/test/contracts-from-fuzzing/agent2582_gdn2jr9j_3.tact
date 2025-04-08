struct Level3 {
  v: Int;
}

struct Level2 {
  k: Bool;
  l3: Level3;
}

struct Level1 {
  flag: Bool?;
  l2: Level2;
}

contract Test {
  storage: Level1;

  init() {
    self.storage = Level1{
      flag: null,
      l2: Level2{
        k: true,
        l3: Level3{
          v: 999,
        },
      },
    };
  }
}
