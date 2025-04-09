struct Level1 {
  x: Int;
  y: Bool?;
}

struct Level2 {
  l1: Level1?;
  s: String;
}

contract TestContract {
  deep: Level2;

  init() {
    self.deep = Level2{
      l1: null,
      s: "optional nest",
    };
  }
}