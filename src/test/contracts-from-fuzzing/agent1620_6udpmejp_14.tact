struct Chain1 { a: Int; }
struct Chain2 { a: Chain1; }
struct Chain3 { a: Chain2; }
struct Chain4 { a: Chain3; }

contract FourDeep {
    val: Chain4;

    init() {
        self.val = Chain4{ a: Chain3{ a: Chain2{ a: Chain1{ a:123 } } } };
    }
}