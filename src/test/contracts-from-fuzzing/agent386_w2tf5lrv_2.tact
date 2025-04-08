struct Level3 {
  prop3a: Int;
  prop3b: Bool;
}

struct Level2 {
  prop2a: Int;
  nested3: Level3;
}

struct Level1 {
  prop1a: Bool;
  nested2: Level2;
}

contract DeepChain {
  top: Level1 = Level1{prop1a: false, nested2: Level2{prop2a: 10, nested3: Level3{prop3a: 11, prop3b: true}}};

  init() {
    self.top = Level1{prop1a: true, nested2: Level2{prop2a: 42, nested3: Level3{prop3a: 123, prop3b: false}}};
  }
}
