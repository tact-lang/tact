struct Level3 {
  z: Int = 5;
}

struct Level2 {
  y: Bool = false;
  sub: Level3;
}

struct Level1 {
  x: Int?;
  inner: Level2;
}

contract DeepNested {
  val: Level1;

  init() {
    self.val = Level1{
      x: null,
      inner: Level2{
        sub: Level3{}
      }
    };
  }
}