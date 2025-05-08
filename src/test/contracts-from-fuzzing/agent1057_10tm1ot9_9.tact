struct Chain1 { next: Chain2; }
struct Chain2 { next: Chain3; }
struct Chain3 { next: Chain4; }
struct Chain4 { next: Chain5; }
struct Chain5 { next: Chain6; }
struct Chain6 { val: Int; }

contract DeepChain {
  node: Chain1;

  init() {
    self.node = Chain1{ next: Chain2{ next: Chain3{ next: Chain4{ next: Chain5{ next: Chain6{ val: 42 } } } } } };
  }
}