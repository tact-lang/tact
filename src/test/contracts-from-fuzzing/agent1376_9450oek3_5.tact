struct Chain1 { next: Int; }
struct Chain2 { next: Chain1; }
struct Chain3 { next: Chain2; }
struct Chain4 { next: Chain3; }

contract ChainStore {
  link: Chain4;

  init() {
    self.link = Chain4{ next: Chain3{ next: Chain2{ next: Chain1{ next:77 }}}};
  }
}
