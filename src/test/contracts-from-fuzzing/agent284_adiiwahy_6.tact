struct ChainLevel3 {
    id: Int;
}

struct ChainLevel2 {
    child: ChainLevel3;
}

struct ChainLevel1 {
    child: ChainLevel2;
}

contract DeepChain {
    root: ChainLevel1;

    init() {
        self.root = ChainLevel1{
            child: ChainLevel2{
                child: ChainLevel3{
                    id: 123
                }
            }
        };
    }
}