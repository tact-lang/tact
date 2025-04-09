struct ChainA {
    k: Int;
    o: ChainB;
}

struct ChainB {
    m: Int;
    p: ChainC;
}

struct ChainC {
    q: Int;
}

contract MultiChain {
    foo: ChainA;

    init() {
        self.foo = ChainA{
            k: 1,
            o: ChainB{
                m: 2,
                p: ChainC{
                    q: 3
                }
            }
        };
    }
}