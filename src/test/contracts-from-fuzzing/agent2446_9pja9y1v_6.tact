struct Chain1 { a: Int; }
struct Chain2 { b: Chain1; }
struct Chain3 { c: Chain2; }
struct Chain4 { d: Chain3; }

contract ChainContract {
    x: Chain4;

    init() {
        self.x = Chain4{ d: Chain3{ c: Chain2{ b: Chain1{ a: 123 } } } };
    }
}