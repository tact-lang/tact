struct Level3 {
  w: Int as uint32;
  z: Bool?;
}

struct Level2 {
  y: Int as int64;
  l3: Level3;
}

struct Level1 {
  x: Int;
  l2: Level2;
}

contract Test {
  data: Level1;

  init() {
    self.data = Level1{
      x: 1,
      l2: Level2{
        y: -7,
        l3: Level3{
          w: 15,
          z: true,
        },
      },
    };
  }
}