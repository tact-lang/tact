struct Level3 {
  x: Int;
}

struct Level2 {
  nested: Level3;
}

struct Level1 {
  inner: Level2;
}

contract TestContract {
  complex: Level1;

  init() {
    self.complex = Level1{
      inner: Level2{
        nested: Level3{
          x: 7
        }
      }
    };
  }
}