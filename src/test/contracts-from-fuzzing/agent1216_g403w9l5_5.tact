struct Level3 {
  x: Int?;
}

struct Level2 {
  l3: Level3;
  flag: Bool;
}

struct Level1 {
  l2: Level2;
  text: String;
}

contract OptionalNestTest {
  s: Level1;

  init() {
    self.s = Level1{
      l2: Level2{
        l3: Level3{ x: null },
        flag: true,
      },
      text: "hi",
    };
  }
}