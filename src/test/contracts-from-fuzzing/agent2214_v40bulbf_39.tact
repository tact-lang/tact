struct Level2 {
  x: Int;
  y: Bool;
}

struct Level1 {
  a: Level2;
  b: Level2;
}

contract DoubleNests {
  val: Level1;

  init() {
    self.val = Level1{
      a: Level2{x:1,y:true},
      b: Level2{x:2,y:false}
    };
  }
}