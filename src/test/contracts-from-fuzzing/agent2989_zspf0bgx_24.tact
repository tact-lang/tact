struct ChainsOne {
    next: ChainsTwo;
}

struct ChainsTwo {
    next: ChainsThree;
}

struct ChainsThree {
    next: ChainsFour;
}

struct ChainsFour {
    next: ChainsFive;
}

struct ChainsFive {
    last: Int;
}

contract ChainHolder {
    chain: ChainsOne;

    init() {
        self.chain = ChainsOne{
            next: ChainsTwo{
                next: ChainsThree{
                    next: ChainsFour{
                        next: ChainsFive{ last: 100 }
                    }
                }
            }
        };
    }
}
