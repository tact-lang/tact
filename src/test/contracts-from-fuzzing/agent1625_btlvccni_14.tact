struct Chain1 { x: Int; }
struct Chain2 { f: Chain1; }
struct Chain3 { g: Chain2; }
struct Chain4 { h: Chain3; }

contract ChainContract {
    data: Chain4;

    init() {
        self.data = Chain4{ h: Chain3{ g: Chain2{ f: Chain1{ x: 99 } } } };
    }
}
