struct Level1 {
  nested: Level2?;
}

struct Level2 {
  inner: Level3?;
}

struct Level3 {
  x: Int = 123;
  y: Bool = false;
}

contract TestContract {
  l1: Level1;

  init() {
    self.l1 = Level1{
      nested: Level2{
        inner: null
      }
    };
  }
}