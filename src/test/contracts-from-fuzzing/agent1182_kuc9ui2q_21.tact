struct Level3 {
  text: String;
}
struct Level2 {
  lvl3: Level3;
}
struct Level1 {
  lvl2: Level2;
}

contract NestedStrings {
  root: Level1;

  init() {
    self.root = Level1{
      lvl2: Level2{
        lvl3: Level3{ text: "deep" }
      }
    };
  }
}
