struct DeepNest3 {
    val: Int;
}

struct DeepNest2 {
    inner: DeepNest3;
}

struct DeepNest1 {
    inner: DeepNest2;
}

contract DeepChain {
    chain: DeepNest1;

    init() {
        self.chain = DeepNest1{ inner: DeepNest2{ inner: DeepNest3{ val: 123 } } };
    }

    receive() {
        self.chain = DeepNest1{ inner: DeepNest2{ inner: DeepNest3{ val: 456 } } };
    }
}