struct BigNested {
  a: Int;
  b: String;
  c: Int?;
  d: String?;
}

struct Level2 {
  sub1: BigNested;
  sub2: BigNested;
}

contract MultiNested {
  x: Level2;

  init() {
    self.x = Level2{
      sub1: BigNested{ a: 1, b: "x", c: null, d: null },
      sub2: BigNested{ a: 2, b: "y", c: 3, d: "d" }
    };
  }
}