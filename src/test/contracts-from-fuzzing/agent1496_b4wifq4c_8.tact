struct Level4 { a: Int; }
struct Level3 { lev4: Level4; }
struct Level2 { lev3: Level3; }
struct Level1 { lev2: Level2; }

contract DeepNestPersistent {
  val: Level1;

  init() {
    self.val = Level1{
      lev2: Level2{
        lev3: Level3{
          lev4: Level4{
            a: 777
          }
        }
      }
    };
  }
}