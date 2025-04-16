struct Level3 {
  value: Int;
}

struct Level2 {
  embedded: Level3;
}

struct Level1 {
  embedded: Level2;
}

contract TestContract {
  nested: Level1;

  init() {
    self.nested = Level1{
      embedded: Level2{
        embedded: Level3{
          value: 123
        }
      }
    };
  }
}