struct DeepNested {
  nested: Level1;
}

struct Level1 {
  foo: Level2;
}

struct Level2 {
  bar: Level3;
}

struct Level3 {
  baz: Int?;
}

contract NestedTest {
  state: DeepNested;
  init() {
    self.state = DeepNested{
      nested: Level1{
        foo: Level2{
          bar: Level3{baz: 42}
        }
      }
    };
  }
}