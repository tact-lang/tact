struct Level3 {
  x: Int;
  y: Int;
}

struct Level2 {
  a: Level3;
  b: Level3;
}

struct Level1 {
  m: Level2;
}

contract LinearDeep {
  data: Level1;

  init() {
    let leaf = Level3{ x:1, y:2 };
    let mid = Level2{ a:leaf, b:leaf };
    self.data = Level1{ m:mid };
  }
}