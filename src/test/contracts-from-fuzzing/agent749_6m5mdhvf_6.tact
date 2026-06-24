struct ChainA {
    b: ChainB;
}

struct ChainB {
    c: ChainC;
}

struct ChainC {
    d: Int?;
}

contract ChainTest {
    ch: ChainA;

    init() {
        self.ch = ChainA{
            b: ChainB{
                c: ChainC{ d: null }
            }
        };
    }
}