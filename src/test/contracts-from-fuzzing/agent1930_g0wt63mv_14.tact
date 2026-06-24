struct Layer1 {
  x: Int;
}

struct Layer2 {
  l1: Layer1;
}

struct Layer3 {
  l2: Layer2;
}

struct Layer4 {
  l3: Layer3;
}

contract VeryDeep {
  deep: Layer4;

  init() {
    self.deep = Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ x: 77 } } } };
  }
}
