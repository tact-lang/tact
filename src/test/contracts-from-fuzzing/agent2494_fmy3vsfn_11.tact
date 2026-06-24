struct Chain1 { a: Int; }
struct Chain2 { c: Chain1; }
struct Chain3 { c: Chain2; }

contract ChainContract {
  storage: Chain3;
  init() {
    self.storage = Chain3{ c: Chain2{ c: Chain1{ a: 42 }}};
  }
}