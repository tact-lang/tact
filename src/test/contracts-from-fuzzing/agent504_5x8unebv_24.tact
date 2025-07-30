struct Chain1 { a: Int }
struct Chain2 { a: Chain1 }
struct Chain3 { a: Chain2 }
struct Chain4 { a: Chain3 }
struct Chain5 { a: Chain4 }
struct Chain6 { a: Chain5 }
struct Chain7 { a: Chain6 }

contract BigChainNest {
    f: Chain7;

    init() {
        self.f = Chain7{ a: Chain6{ a: Chain5{ a: Chain4{ a: Chain3{ a: Chain2{ a: Chain1{ a: 7 } } } } } } };
    }

    receive() {
        let _ = self.f;
    }
}