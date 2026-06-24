struct Level3 {
  k: Int;
  t: String?;
}

struct Level2 {
  a: Int;
  nested: Level3;
}

struct Level1 {
  f: Bool;
  inner: Level2;
}

contract OptDeep {
  val: Level1?;
  init() {
    self.val = Level1{f: true, inner: Level2{a: 99, nested: Level3{k: 88, t: null}}};
  }
}
