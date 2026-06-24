struct Level3 { f: Int }
struct Level2 { l3: Level3 }
struct Level1 { l2a: Level2; l2b: Level2 }
struct Root { l1a: Level1; l1b: Level1 }

contract TreeNesting {
  root: Root;
  init() {
    self.root = Root{
      l1a: Level1{
        l2a: Level2{l3: Level3{f:1}},
        l2b: Level2{l3: Level3{f:2}}
      },
      l1b: Level1{
        l2a: Level2{l3: Level3{f:3}},
        l2b: Level2{l3: Level3{f:4}}
      }
    };
  }
}