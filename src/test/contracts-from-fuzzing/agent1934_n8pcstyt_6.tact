struct Chain1 { f: Int; }
struct Chain2 { f: Chain1; }
struct Chain3 { f: Chain2; }
struct Chain4 { f: Chain3; }
struct Chain5 { f: Chain4; }

contract DeepChain {
    state: Chain5;

    init() {
        self.state = Chain5{ f: Chain4{ f: Chain3{ f: Chain2{ f: Chain1{ f: 1 } } } } };
    }
}
