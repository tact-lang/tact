struct Level3 {
  d: Int;
}

struct Level2 {
  c: Level3;
}

struct Level1 {
  b: Level2;
}

contract OptionalDefaults {
  x: Int = 0;
  y: Bool? = null;
  level: Level1 = Level1{
    b: Level2{
      c: Level3{
        d: 100
      }
    }
  };

  init() {
    self.x=1;
    self.y=true;
    self.level=Level1{
      b: Level2{
        c: Level3{
          d:200
        }
      }
    };
  }
}