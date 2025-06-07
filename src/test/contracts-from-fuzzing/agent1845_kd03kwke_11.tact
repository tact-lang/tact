// Test optional struct at root, nested structs inside
struct LevelInner {
  num: Int;
  flag: Bool;
}

contract OptNestedRoot {
  v: LevelInner?;
  init() {
    self.v = null;
  }
}
