struct Level1 { l2: Level2; a: Int; }
struct Level2 { l3: Level3; b: Int; }
struct Level3 { l4: Level4; c: Int; }
struct Level4 { l5: Level5; d: Int; }
struct Level5 { e: Int; }

contract TestContract {
  top: Level1;

  init() {
    self.top = Level1{
      a:1, l2: Level2{
        b:2, l3: Level3{
          c:3, l4: Level4{
            d:4, l5: Level5{e:5}
          }
        }
      }
    };
  }
}