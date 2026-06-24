struct Level4 { x: Int; }
struct Level3 { l4: Level4; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }
struct Root { l1: Level1; }

contract Test12 {
  root: Root;

  init() {
    self.root = Root{
      l1: Level1{
        l2: Level2{
          l3: Level3{
            l4: Level4{ x: 99 }
          }
        }
      }
    };
  }
}
