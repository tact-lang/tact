struct Level3 {
  zz: Int;
}

struct Level2 {
  yy: Level3;
}

struct Level1 {
  xx: Level2;
}

contract NestedStructs {
  s: Level1;

  init() {
    self.s = Level1{
      xx: Level2{
        yy: Level3{
          zz: 42
        }
      }
    };
  }
}