struct Level3 {
  f: Int?;
}

struct Level2 {
  c: Int?;
  d: Level3?;
}

struct Level1 {
  a: Int?;
  b: Level2?;
}

contract ComplexNestedOptional {
  state: Level1;

  init() {
    self.state = Level1{
      a: null,
      b: Level2{
        c: null,
        d: Level3{ f: 42 }
      }
    };
  }
}