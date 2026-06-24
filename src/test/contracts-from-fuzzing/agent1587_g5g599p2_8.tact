struct Chain1 {
    value: Int;
}

struct Chain2 {
    chain1: Chain1;
}

struct Chain3 {
    chain2: Chain2;
}

contract DeepChain {
    data: Chain3;

    init() {
        self.data = Chain3{
            chain2: Chain2{
                chain1: Chain1{
                    value: 42
                }
            }
        };
    }
}