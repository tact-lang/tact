struct Chain3 {
  a: Int;
}

struct Chain2 {
  next: Chain3;
}

struct Chain1 {
  next: Chain2;
}

contract ChainNested {
  chain: Chain1;

  init() {
    self.chain = Chain1{ next: Chain2{ next: Chain3{ a: 5 } } };
  }
}
