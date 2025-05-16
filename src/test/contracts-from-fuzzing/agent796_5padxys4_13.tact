struct Layer1 {
  f1: Int; f2: Int;
}

struct Layer2 {
  l1: Layer1; l2: Layer1;
}

struct Layer3 {
  lvl2a: Layer2; lvl2b: Layer2;
}

contract Test {
  nested: Layer3;
  init() {
    self.nested = Layer3{
      lvl2a: Layer2{ l1: Layer1{ f1:1,f2:2 }, l2: Layer1{ f1:3,f2:4 } },
      lvl2b: Layer2{ l1: Layer1{ f1:5,f2:6 }, l2: Layer1{ f1:7,f2:8 } }
    };
  }
}