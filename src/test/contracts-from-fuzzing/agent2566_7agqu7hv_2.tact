struct Level1 {
  a: Int;
  b: Bool;
}

struct Level2 {
  c: Level1;
  d: String;
}

struct Level3 {
  e: Level2;
  f: String;
}

contract NestedContract {
  x: Level3;

  init() {
    self.x = Level3{
      e: Level2{c: Level1{a: 1, b: true}, d: "hello"},
      f: "world"
    };
  }
}
