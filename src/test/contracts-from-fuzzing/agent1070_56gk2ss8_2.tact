struct Level3 {
  x: Int;
}

struct Level2 {
  y: Level3;
}

struct Level1 {
  z: Level2;
}

contract DeepNest {
  value: Level1;

  init() {
    self.value = Level1{
      z: Level2{
        y: Level3{
          x: 123
        }
      }
    };
  }
}