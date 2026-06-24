struct Level3 {
  a: Int;
}

struct Level2 {
  l3: Level3?;
}

struct Level1 {
  l2: Level2?;
}

contract C {
  state: Level1;

  init() {
    self.state = Level1{
      l2: null
    };
  }
}