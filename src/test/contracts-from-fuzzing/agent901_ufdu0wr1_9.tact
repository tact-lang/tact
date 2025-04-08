struct Level1 {
  f1: Int;
  f2: String;
}

struct Level2 {
  nested: Level1;
  optionalS: Level1?;
}

struct Level3 {
  arr1: Level2;
  arr2: Level2?;
}

contract TestContract {
  data: Level3;

  init() {
    self.data = Level3 {
      arr1: Level2 { nested: Level1{ f1:1, f2:"a" }, optionalS: null },
      arr2: null,
    };
  }
}