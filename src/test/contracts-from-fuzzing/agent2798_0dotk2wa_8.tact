struct ChainTail {
    value: Int;
}

struct ChainMid {
    midVal: Int;
    tail: ChainTail;
}

struct ChainTop {
    topVal: Int;
    mid: ChainMid;
}

contract ChainStructContract {
    chain: ChainTop;

    init() {
        self.chain = ChainTop{
            topVal: 1,
            mid: ChainMid{
                midVal: 2,
                tail: ChainTail{ value:3 }
            }
        };
    }
}