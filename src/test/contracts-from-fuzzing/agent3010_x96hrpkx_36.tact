struct Level1 { level2: Level2; }
struct Level2 { level3: Level3; }
struct Level3 { foo: Int; }

contract ThreeNest {
  val: Level1;

  init() {
    self.val = Level1{ level2: Level2{ level3: Level3{ foo: 333 } } };
  }
}