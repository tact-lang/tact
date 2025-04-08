struct Level3 { val: Int }
struct Level2 { lvl3: Level3 }
struct Level1 { lvl2: Level2 }
contract Deep4 {
  lvl1: Level1;
  init() {
    self.lvl1 = Level1{ lvl2: Level2{ lvl3: Level3{ val: 3 }}};
  }
}