struct Level2 {
  s: String;
  f: Bool;
}

struct Level1 {
  count: Int;
  inner: Level2;
}

contract DeepNest {
  obj: Level1;

  init() {
    self.obj = Level1{ count: 1, inner: Level2 { s: "hi", f: false } };
  }
}