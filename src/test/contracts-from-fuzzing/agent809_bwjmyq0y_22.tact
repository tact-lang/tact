struct ChainTail {
    val: Int? = null;
}

struct ChainMid {
    nested: ChainTail = ChainTail{};
}

struct ChainHead {
    nested: ChainMid = ChainMid{};
}

contract ChainDefaults {
    data: ChainHead;

    init() {
        self.data = ChainHead{
            nested: ChainMid{
                nested: ChainTail{
                    val: null
                }
            }
        };
    }
}