struct Level3 {
  z: Int;
}

struct Level2 {
  y: Int;
  deep: Level3;
}

struct Level1 {
  x: Int;
  inner: Level2;
}

contract DeepNested {
  state: Level1;

  init() {
    self.state = Level1{
      x: 1,
      inner: Level2{
        y: 2,
        deep: Level3{z: 3}
      }
    };
  }
}
