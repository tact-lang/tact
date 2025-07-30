struct ChainC {
    val: Int;
}

struct ChainB {
    c: ChainC;
}

struct ChainA {
    b: ChainB;
}

contract ChainWrap {
    data: ChainA;

    init() {
        self.data = ChainA{
            b: ChainB{
                c: ChainC{
                    val: 99
                }
            }
        };
    }
}