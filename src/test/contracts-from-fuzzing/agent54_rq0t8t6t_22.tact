struct Chain3 {
    chain2: Chain2;
}

struct Chain2 {
    chain1: Chain1;
}

struct Chain1 {
    valint: Int;
    valbool: Bool;
    valaddr: Address;
}

contract LongChainContract {
    chain: Chain3;

    init() {
        self.chain = Chain3{
            chain2: Chain2{
                chain1: Chain1{
                    valint: 100,
                    valbool: true,
                    valaddr: myAddress()
                }
            }
        };
    }
}