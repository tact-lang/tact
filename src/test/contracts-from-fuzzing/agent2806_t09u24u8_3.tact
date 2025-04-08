struct Level3 {
  v: String;
}

struct Level2 {
  c: Level3;
  d: Int;
}

struct Level1 {
  a: Level2;
  b: Bool;
}

contract MultiLevel {
  nested: Level1;

  init() {
    self.nested = Level1{
      a: Level2{c: Level3{v: "deep"}, d: 7},
      b: true
    };
  }
}