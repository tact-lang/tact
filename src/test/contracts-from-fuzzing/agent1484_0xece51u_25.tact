struct Chain1 { f: Int; }
struct Chain2 { f: Chain1; }
struct Chain3 { f: Chain2; }
struct Chain4 { f: Chain3; }
struct Chain5 { f: Chain4; }

contract ChainContract {
  c: Chain5;

  init() {
    self.c = Chain5{ f: Chain4{ f: Chain3{ f: Chain2{ f: Chain1{f: 777} } } } };
  }
}