struct ChainA {
    b: ChainB;
}

struct ChainB {
    c: ChainC;
}

struct ChainC {
    d: Int = 12345;
}

contract TestContract {
    chain: ChainA;
    init() {
        self.chain = ChainA{
            b: ChainB{
                c: ChainC{}
            }
        };
    }
    receive() {}
}