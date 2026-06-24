struct Chain3 {
    value: Int;
}

struct Chain2 {
    next: Chain3;
}

struct Chain1 {
    next: Chain2;
}

contract TestContract {
    chain: Chain1;
    init() {
        self.chain = Chain1{
            next: Chain2{
                next: Chain3{
                    value: 100
                }
            }
        };
    }
}