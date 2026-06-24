struct Level2 {
  a: Int;
  b: Bool;
}

struct Level1 {
  nested: Level2;
  flag: Bool;
}

contract TestContract {
  nestedStruct: Level1;

  init() {
    self.nestedStruct = Level1{
      nested: Level2{ a: 123, b: true },
      flag: false
    };
  }
}