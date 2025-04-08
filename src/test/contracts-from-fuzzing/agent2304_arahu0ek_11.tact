struct Chain3 {
    f: Int;
}

struct Chain2 {
    chain3: Chain3;
}

struct Chain1 {
    chain2: Chain2;
}

contract DeepChain {
    root: Chain1;
    init() {
        self.root = Chain1{
            chain2: Chain2{
                chain3: Chain3{
                    f: 123
                }
            }
        };
    }
}