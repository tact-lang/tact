// test multi optional nested
struct Level2 { val: Int; }
struct Level1 { lvl2: Level2?; }
contract MultiOptNest {
  data: Level1?;
  init() {
    self.data = Level1{lvl2: Level2{val:42}};
  }
}