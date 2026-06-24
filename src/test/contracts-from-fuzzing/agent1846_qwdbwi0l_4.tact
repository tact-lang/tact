struct Level3 {
  z: Int = 42;
}

struct Level2 {
  y: Level3? = null;
  x: Int = 7;
}

struct Level1 {
  foo: Level2 = Level2{};
  bar: Bool = false;
}

contract DeepNestedTest {
  top: Level1 = Level1{};
}