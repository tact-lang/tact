struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    next: Chain3;
}

struct Chain3 {
    next: Chain4;
}

struct Chain4 {
    leaf: Int;
}

contract TestContract {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        leaf: 99,
                    }
                }
            }
        };
    }
}