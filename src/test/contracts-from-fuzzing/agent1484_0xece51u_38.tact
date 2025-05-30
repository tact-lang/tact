struct Layer1 {
  l2: Layer2;
}

struct Layer2 {
  l3: Layer3;
}

struct Layer3 {
  val: Int?;
}

contract OptInDeepest {
  l1: Layer1;

  init() {
    self.l1 = Layer1{ l2: Layer2{ l3: Layer3{ val: null } } };
  }
}