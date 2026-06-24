struct Level3 {
  f3: Int;
}

struct Level2 {
  f2opt: Level3?;
}

struct Level1 {
  f1opt: Level2?;
}

contract NestedOpt {
  d: Level1;
  init() {
    self.d = Level1{f1opt: Level2{f2opt: Level3{f3: 42}}};
  }
}