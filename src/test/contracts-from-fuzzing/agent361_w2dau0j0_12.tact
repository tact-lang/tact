struct Level1 {
  a: Int;
}
struct Level2 {
  b: Int;
  lvl1: Level1;
}
struct Level3 {
  c: Int;
  lvl2: Level2;
}
contract StructChain {
  mainData: Level3;
  init() {
    self.mainData = Level3{
      c: 3,
      lvl2: Level2{
        b: 2,
        lvl1: Level1{ a: 1 }
      }
    };
  }
}
