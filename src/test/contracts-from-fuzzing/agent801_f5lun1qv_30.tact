struct ChainEnd {
    v: Int?;
}

struct ChainMid {
    n: ChainEnd;
}

struct ChainTop {
    m: ChainMid;
}

contract NullableEndChain {
    root: ChainTop;

    init() {
        self.root = ChainTop{
            m: ChainMid{
                n: ChainEnd{ v: 100 }
            }
        };
    }
}