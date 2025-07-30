struct LevelA {
  a: Int;
}
struct LevelB {
  b: LevelA;
}
struct LevelC {
  c: LevelB;
}
struct LevelD {
  d: LevelC;
}

contract DeepEmbed {
  val: LevelD;
  init() {
    self.val = LevelD { d: LevelC { c: LevelB { b: LevelA { a: 9 } } } };
  }
}