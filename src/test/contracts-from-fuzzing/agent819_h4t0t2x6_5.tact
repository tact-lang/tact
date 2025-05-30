struct Level3 {
  z: Int?;
}

struct Level2 {
  y: Level3?;
}

struct Level1 {
  x: Level2?;
}

contract TestContract {
  storage: Level1;

  init() {
    self.storage = Level1{ x: null };
  }
}