struct Chain3 {
    a: Chain2;
}

struct Chain2 {
    a: Chain1;
}

struct Chain1 {
    x: Int;
}

contract LongChain {
    root: Chain3;

    init() {
        self.root = Chain3{ a: Chain2{ a: Chain1{ x: 42 }}};
    }
}