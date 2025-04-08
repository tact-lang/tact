struct Level3 {
  x: Int;
  y: Bool;
}

struct Level2 {
  nested3: Level3;
  flag: Bool;
}

struct Level1 {
  nested2: Level2;
  data: String;
}

contract MulNest {
  nested1: Level1;

  init() {
    self.nested1 = Level1 {
      nested2: Level2 {
        nested3: Level3 { x: 1, y: false },
        flag: true
      },
      data: "test"
    };
  }
}