struct Chain1 { a: Int }
struct Chain2 { c: Chain1 }
struct Chain3 { p: Chain2 }
struct Chain4 { x: Chain3 }

contract ChainNested {
    f: Chain4;

    init() {
        self.f = Chain4{ x: Chain3{ p: Chain2{ c: Chain1{ a: 5 } } } };
    }
}