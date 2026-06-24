struct Level3 {
  f1: Int;
  f2: Bool;
}

struct Level2 {
  l3: Level3;
  f3: String?;
}

struct Level1 {
  l2: Level2;
  f4: Int?;
}

contract Test {
  deepNested: Level1;

  init() {
    self.deepNested = Level1{
      l2: Level2{
        l3: Level3{f1: 7, f2: false},
        f3: "nested"
      },
      f4: null
    };
  }
}