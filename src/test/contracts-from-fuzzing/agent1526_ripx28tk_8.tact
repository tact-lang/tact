struct ChainLevel3 {
    value: Int;
}

struct ChainLevel2 {
    nested: ChainLevel3;
}

struct ChainLevel1 {
    nested: ChainLevel2;
}

contract DeepChainContract {
    data: ChainLevel1;

    init() {
        self.data = ChainLevel1{
            nested: ChainLevel2{
                nested: ChainLevel3{
                    value: 777,
                },
            },
        };
    }
}