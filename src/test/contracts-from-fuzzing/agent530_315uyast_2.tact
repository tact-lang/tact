struct Level1 { f1: Int; f2: Int; }
struct Holder { nested: Level1; val: Int; }

contract NestedTest {
  s: Holder;

  init() {
    self.s = Holder{
      nested: Level1{ f1: 5, f2: 10 },
      val: 42
    };
  }
}