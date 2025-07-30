struct Chain1 { a: Int; }
struct Chain2 { b: Chain1; }
struct Chain3 { c: Chain2; }
struct Chain4 { d: Chain3; }

contract DeepChain {
    val: Chain4;

    init() {
        self.val = Chain4{ d: Chain3{ c: Chain2{ b: Chain1{ a: 1 } } } };
    }
}