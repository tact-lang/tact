struct Chain1 { a: Int }
struct Chain2 { c1: Chain1 }
struct Chain3 { c2: Chain2 }
struct Chain4 { c3: Chain3 }
struct Chain5 { c4: Chain4 }
struct Chain6 { c5: Chain5 }
struct Chain7 { c6: Chain6 }

contract ChainNested {
  root: Chain7;

  init() {
    self.root = Chain7{c6: Chain6{c5: Chain5{ c4: Chain4{ c3: Chain3{ c2: Chain2{ c1: Chain1{a:123} }}}}}};
  }
}