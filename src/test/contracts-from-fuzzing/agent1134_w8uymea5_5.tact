struct Chain3 {
    v: Int;
}

struct Chain2 {
    next: Chain3;
}

struct Chain1 {
    start: Chain2;
}

contract ChainTest {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            start: Chain2{
                next: Chain3{
                    v: 321
                }
            }
        };
    }
}