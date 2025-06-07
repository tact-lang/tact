struct LevelD {
  x: Int;
}
struct LevelC {
  d: LevelD;
}
struct LevelB {
  c: LevelC;
}
struct LevelA {
  b: LevelB;
}
contract Levels {
  top: LevelA;
  init() {
    self.top = LevelA{ b: LevelB{ c: LevelC{ d: LevelD{ x:123 } } } };
  }
}