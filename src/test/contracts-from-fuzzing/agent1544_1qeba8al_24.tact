struct Layer2 {
  a: Int;
}
struct Layer1 {
  b: Layer2;
}

contract Cross {
  f: Layer1;

  init() {
    self.f = Layer1{ b: Layer2{ a: 100 } };
  }
}
