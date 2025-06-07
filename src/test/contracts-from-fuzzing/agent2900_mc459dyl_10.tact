struct Chain {
    a: Int;
    b: Int;
    next: Chain2;
}

struct Chain2 {
    c: Int;
    d: Int;
}

contract ChainTest {
    chain: Chain;

    init() {
        self.chain = Chain{
            a: 1,
            b: 2,
            next: Chain2{
                c: 3,
                d: 4,
            },
        };
    }
}
