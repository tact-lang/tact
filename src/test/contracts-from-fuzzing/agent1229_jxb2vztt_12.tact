struct ChainBottom { lastVal: Int; }
struct ChainMid { next: ChainBottom; midVal: Int; }
struct ChainTop { next: ChainMid; topVal: Int; }

contract ChainContract {
    chain: ChainTop;

    init() {
        self.chain = ChainTop{
            next: ChainMid{
                next: ChainBottom{lastVal:88},
                midVal:77
            },
            topVal:66
        };
    }
}
