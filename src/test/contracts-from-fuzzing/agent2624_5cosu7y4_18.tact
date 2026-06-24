struct Deeply {
    n1: L2Opt?;
}

struct L2Opt {
    n2: L3Opt?;
}

struct L3Opt {
    n3: Int?;
}

contract OptInOptChain {
    chain: Deeply;

    init() {
        self.chain = Deeply{
            n1: L2Opt{
                n2: L3Opt{
                    n3: null
                }
            }
        };
    }
}
