struct Level1 {
  a: Int;
}

struct Level2 {
  b: Int;
  x: Level1;
}

struct Level3 {
  c: Int;
  y: Level2;
}

contract ManyNest {
  q: Level3;

  init(){
    self.q = Level3{
      c:1,
      y: Level2{
        b:2,
        x: Level1{ a:3 }
      }
    };
  }
}