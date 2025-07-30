struct Level3 { foo: Int; }
struct Level2 { inner3: Level3; }
struct Level1 { inner2: Level2; }
struct Top { inner1: Level1; }

contract NestedDepth4 {
  deepStruct: Top;
  init() {
    self.deepStruct = Top{ inner1: Level1{ inner2: Level2{ inner3: Level3{ foo: 77 }}}};
  }
}