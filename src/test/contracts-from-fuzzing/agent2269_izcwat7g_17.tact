struct Layer3 {
  l3: Int;
}

struct Layer2 {
  l2: Layer3;
}

struct Layer1 {
  l1: Layer2;
}

struct Layer0 {
  l0: Layer1;
}

contract ChainNested {
  nested: Layer0;

  init() {
    self.nested = Layer0{ l0: Layer1{ l1: Layer2{ l2: Layer3{ l3: 42 } } } };
  }
}
