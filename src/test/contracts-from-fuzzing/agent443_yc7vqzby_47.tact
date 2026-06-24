struct Level1 { f1: Int; }
struct Level2 { f2: Level1; }
struct Level3 { f3: Level2; }
struct Level4 { f4: Level3; }
struct Level5 { f5: Level4; }

contract SuperDeep {
  val: Level5;

  init() {
    self.val = Level5{
      f5: Level4{
        f4: Level3{ f3: Level2{ f2: Level1{ f1: 123 } } }
      }
    };
  }
}
