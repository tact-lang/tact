struct DeepNest3 {
  f: Bool;
}

struct DeepNest2 {
  inner: DeepNest3;
}

struct DeepNest1 {
  inner: DeepNest2;
}

contract Test {
  deep: DeepNest1;

  init() {
    self.deep = DeepNest1{ inner: DeepNest2{ inner: DeepNest3{ f: true } } };
  }
}