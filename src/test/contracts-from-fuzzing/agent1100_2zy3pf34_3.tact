struct Level2 {
  val: Int;
}

struct Level1 {
  nested: Level2;
}

contract DeepNestedTest {
  content: Level1;

  init() {
    self.content = Level1{
      nested: Level2{ val: 42 }
    };
  }
}
