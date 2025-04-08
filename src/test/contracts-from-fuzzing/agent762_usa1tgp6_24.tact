struct IntPair {
  x: Int;
  y: Int;
}

struct Container {
  pair: IntPair;
}

contract InitializedNested {
  value: Container;

  init() {
    self.value = Container { pair: IntPair { x: 10, y: 20 } };
  }
}