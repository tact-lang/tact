struct Level3 {
  d: Int;
  e: Int;
}

struct Level2 {
  b: Level3;
  c: Int?;
}

struct Level1 {
  a: Level2;
}

contract TestContract {
  nested: Level1;

  init() {
    self.nested = Level1{
      a: Level2{
        b: Level3{ d: 1, e: 2 },
        c: null
      }
    };
  }
}