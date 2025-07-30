struct Level3 {
  d: Int;
}

struct Level2 {
  c: Level3;
}

struct Level1 {
  b: Level2;
}

contract DeepNestContract {
  a: Level1;

  init() {
    self.a = Level1{
      b: Level2{
        c: Level3{
          d: 42
        }
      }
    };
  }
}