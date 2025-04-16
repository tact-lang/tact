struct DeepNested {
  level2: Level2;
}

struct Level2 {
  level3: Level3;
}

struct Level3 {
  x: Int = 1;
  y: Bool = true;
}

contract DeepTest {
  data: DeepNested;
  init() { self.data = DeepNested{ level2: Level2{ level3: Level3{} } }; }
}