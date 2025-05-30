struct Nested1 {
  x: Int;
}

struct Nested2 {
  n1: Nested1;
}

struct Nested3 {
  n2: Nested2;
}

contract NestedChain {
  deep: Nested3;

  init() {
    self.deep = Nested3{ n2: Nested2{ n1: Nested1{ x: 99 } } };
  }
}