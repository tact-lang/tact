struct ChainInner {
    v: Int;
}

struct ChainMiddle {
    inner: ChainInner;
}

struct ChainOuter {
    middle: ChainMiddle;
}

contract ChainSet {
    data: ChainOuter;

    init() {
        self.data = ChainOuter{
            middle: ChainMiddle{
                inner: ChainInner{
                    v:77
                }
            }
        };
    }
}