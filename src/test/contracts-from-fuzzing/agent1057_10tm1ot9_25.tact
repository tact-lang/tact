struct LevelB {
  x:Int; y:Int; z:Int;
}

struct LevelA {
  b1: LevelB;
  b2: LevelB;
  b3: LevelB;
  bOpt: LevelB?;
}

contract ManyNestedRepeats {
  top: LevelA;

  init() {
    self.top = LevelA{
      b1: LevelB{x:1,y:2,z:3},
      b2: LevelB{x:4,y:5,z:6},
      b3: LevelB{x:7,y:8,z:9},
      bOpt: null
    };
  }
}