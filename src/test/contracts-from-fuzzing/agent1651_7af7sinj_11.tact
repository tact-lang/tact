struct Chain1 {
  a: Int;
}

struct Chain2 {
  x: Chain1;
}

struct Chain3 {
  y: Chain2;
}

contract ChainTest {
  data: Chain3;

  init() {
    self.data = Chain3{ y: Chain2{ x: Chain1{ a: 42 } } };
  }
}