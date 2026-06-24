struct MultiLayer {
  level1: Layer1;
}

struct Layer1 {
  level2: Layer2;
}

struct Layer2 {
  level3: Layer3;
}

struct Layer3 {
  flag: Bool;
}

contract FlagInsideDeep {
  all: MultiLayer;

  init() {
    self.all = MultiLayer{ level1: Layer1{ level2: Layer2{ level3: Layer3{ flag: true } } } };
  }
}