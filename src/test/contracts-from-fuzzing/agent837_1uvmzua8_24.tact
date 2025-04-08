struct LevelOne { 
  a: Int; 
}

struct LevelTwo {
  b: LevelOne; 
}

struct LevelThree {
  c: LevelTwo; 
}

struct LevelFour {
  d: LevelThree;
}

contract FourDeep {
  s: LevelFour;
  init() {
    self.s = LevelFour{
      d: LevelThree{
        c: LevelTwo{
          b: LevelOne{
            a: 42
          }
        }
      }
    };
  }
}