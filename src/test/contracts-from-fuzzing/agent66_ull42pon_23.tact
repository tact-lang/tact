// Deep chain optional edge
struct Level1 { f: Int?; }
struct Level2 { f: Level1; }
struct Level3 { f: Level2; }
struct Level4 { f: Level3; }
contract DeepOpt {
  root: Level4;
  init() {
    self.root = Level4{f: Level3{f: Level2{f: Level1{f: null}}}};
  }
}