struct DeepNest3 {
  e: Int;
}

struct DeepNest2 {
  d: DeepNest3;
}

struct DeepNest1 {
  c: DeepNest2;
}

contract DeepNesting {
  x: DeepNest1;

  init() {
    self.x = DeepNest1{ c: DeepNest2{ d: DeepNest3{ e: 7 } } };
  }
}
