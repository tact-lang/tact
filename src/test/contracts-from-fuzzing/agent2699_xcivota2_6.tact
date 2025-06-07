struct Tiny {
    x: Int;
}

struct Chain1 {
    next: Tiny;
}

struct Chain2 {
    next: Chain1;
}

struct Chain3 {
    next: Chain2;
}

struct Chain4 {
    next: Chain3;
}

contract LongChainedStructTest {
    chain: Chain4;

    init() {
        self.chain = Chain4{
            next: Chain3{
                next: Chain2{
                    next: Chain1{
                        next: Tiny{x: 99},
                    },
                },
            },
        };
    }
}