struct A {
  a: Int?;
}

struct B {
  b: A?;
}

contract NestedOptChain {
  chain: B;

  init() {
    self.chain = B{ b: null };
  }
}
