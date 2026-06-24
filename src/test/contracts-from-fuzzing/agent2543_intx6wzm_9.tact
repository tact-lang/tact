struct Chain3 { x: Int; }
struct Chain2 { c3: Chain3; }
struct Chain1 { c2: Chain2; }
contract ChainTest {
  c: Chain1;
  init() {
    self.c = Chain1{ c2: Chain2{ c3: Chain3{ x: 42 } } };
  }
}