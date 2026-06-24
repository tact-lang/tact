struct Level3 { val: Int }
struct Level2 { inner: Level3 }
struct Level1 { nested: Level2 }

contract Test {
  data1: Level1;
  data2: Level1;

  init() {
    self.data1 = Level1{ nested: Level2{ inner: Level3{ val: 1 } } };
    self.data2 = Level1{ nested: Level2{ inner: Level3{ val: 2 } } };
  }
}