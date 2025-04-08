struct Level3 {
  value: Int;
}

struct Level2 {
  nested: Level3;
}

struct Level1 {
  nested: Level2;
}

contract Nested3 {
  l1: Level1;

  init() {
    self.l1 = Level1{
      nested: Level2{
        nested: Level3{
          value: 99
        }
      }
    };
  }
}