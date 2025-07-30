struct DeepA {
    x: Int;
}

struct DeepB {
    a: DeepA;
}

struct DeepC {
    b: DeepB;
}

contract DeepChain {
    chain: DeepC;

    init() {
        self.chain = DeepC { b: DeepB { a: DeepA { x: 11 } } };
    }
}
