struct Chain3 {
    inner: Chain2;
}

struct Chain2 {
    inner: Chain1;
}

struct Chain1 {
    val: Int;
}

contract DeepChain {
    chain: Chain3;
    flag: Bool = false;

    init() {
        self.chain = Chain3{ inner: Chain2{ inner: Chain1{ val: 999 } } };
    }
}