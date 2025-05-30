struct MultiLevel {
  inner1: Level1;
  inner2: Level2;
}

struct Level1 {
  x: Int;
  y: Bool?;
}

struct Level2 {
  z: String;
  w: Int?;
}

contract Test {
  obj: MultiLevel = MultiLevel{
    inner1: Level1{ x: 1, y: null },
    inner2: Level2{ z: "hi", w: null }
  };

  init() {
    self.obj = MultiLevel{
      inner1: Level1{ x: 5, y: true },
      inner2: Level2{ z: "ok", w: 7 }
    };
  }

  receive() {}
}