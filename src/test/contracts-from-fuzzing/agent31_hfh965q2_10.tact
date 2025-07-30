struct Level3 {
  v: Int;
}
struct Level2 {
  nested: Level3;
}
struct Level1 {
  nested: Level2;
}

contract Test {
  deep: Level1;

  init() {
    self.deep = Level1{
      nested: Level2{
        nested: Level3{
          v: 999
        }
      }
    };
  }
}