struct Level3 { f: Bool; }
struct Level2 { d: Level3; e: Int; }
struct Level1 { b: Int; c: Level2; }

contract DeepNestTest {
  nested: Level1;

  init() {
    self.nested = Level1{
      b: 5,
      c: Level2{
        d: Level3{ f: true },
        e: 9
      }
    };
  }
}
