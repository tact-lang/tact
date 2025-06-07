struct Chain1 { f: Int; }
struct Chain2 { f: Chain1; }
struct Chain3 { f: Chain2; }
struct Chain4 { f: Chain3; }

contract TestContract {
    chain: Chain4;

    init() {
        self.chain = Chain4{ f: Chain3{ f: Chain2{ f: Chain1{ f: 99 }}}};
    }
}