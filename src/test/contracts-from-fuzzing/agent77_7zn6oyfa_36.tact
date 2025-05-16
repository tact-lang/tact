// Empty optional assignment test on multiple levels
struct Level1 { x: Int?; }
struct Level2 { l1: Level1?; }
struct Level3 { l2: Level2?; }

contract MultiEmptyOpt {
   root: Level3;
   init() {
     self.root = Level3 { l2:null };
   }
}