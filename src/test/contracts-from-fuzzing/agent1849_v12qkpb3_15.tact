struct Chain3 {
  next: Chain2;
}
struct Chain2 {
  next: Chain1;
}
struct Chain1 {
  value: Int;
}

contract ChainTest {
  chain: Chain3;

  init() {
    self.chain = Chain3{ next: Chain2{ next: Chain1{ value: 77 } } };
  }
}