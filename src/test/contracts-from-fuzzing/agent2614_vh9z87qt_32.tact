struct ChainNested1 {
    val: Int;
}

struct ChainNested2 {
    next: ChainNested1;
}

struct ChainNested3 {
    next: ChainNested2;
}

contract DeepChainStorage {
    chain: ChainNested3;

    init() {
        self.chain = ChainNested3{
            next: ChainNested2{
                next: ChainNested1{
                    val: 99
                }
            }
        };
    }
}