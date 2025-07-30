struct Chain3 {
    x: Int;
}

struct Chain2 {
    inner: Chain3;
}

struct Chain1 {
    inner: Chain2;
}

contract LongChain {
    chain: Chain1;

    init() {
        self.chain = Chain1 { inner: Chain2{ inner: Chain3{ x: 42 } } };
    }
}