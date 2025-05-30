struct Level3 {
  innerVal: String;
}

struct Level2 {
  nested: Level3;
}

struct Level1 {
  deep: Level2;
}

contract DeepNestedTest {
  nestedVal: Level1;

  init() {
    self.nestedVal = Level1{
      deep: Level2{
        nested: Level3{
          innerVal: "done"
        }
      }
    };
  }
}