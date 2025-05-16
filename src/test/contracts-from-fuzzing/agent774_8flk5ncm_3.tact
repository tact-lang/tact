struct Level1 {
  x: Int;
  next: Level2;
}

struct Level2 {
  y: Int;
  next: Level3;
}

struct Level3 {
  z: Bool;
  text: String?;
}

contract DeepNest {
  deepField: Level1;
  init() {
    self.deepField = Level1{
      x: 1,
      next: Level2{
        y: 2,
        next: Level3{
          z: true,
          text: "end"
        }
      }
    };
  }
}