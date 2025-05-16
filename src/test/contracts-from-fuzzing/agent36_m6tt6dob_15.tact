struct Level1 { v1:Int }
struct Level2 { s: Level1 }
struct Level3 { s: Level2 }
struct Level4 { s: Level3 }
struct Level5 { s: Level4 }

contract FiveDeep {
  s: Level5;
  init() { self.s = Level5{ s: Level4{ s: Level3{ s: Level2 { s: Level1 { v1: 5 } } } } };
  }
}