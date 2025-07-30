struct ChainLevel1 {
    next: ChainLevel2;
}

struct ChainLevel2 {
    next: ChainLevel3;
}

struct ChainLevel3 {
    next: ChainLevel4;
}

struct ChainLevel4 {
    num: Int;
}

contract C {
    chain: ChainLevel1;

    init() {
        self.chain = ChainLevel1{
            next: ChainLevel2{
                next: ChainLevel3{
                    next: ChainLevel4{ num: 123 }
                }
            }
        };
    }
}