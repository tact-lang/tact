struct Chain1 { next: Chain2 }
struct Chain2 { next: Chain3 }
struct Chain3 { next: Chain4 }
struct Chain4 { val: Int }

contract ChainNested {
    d: Chain1;

    init() {
        self.d = Chain1{ next: Chain2{ next: Chain3{ next: Chain4{ val: 55 }}}};
    }
}