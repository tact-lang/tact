struct ChainLevel3 {
    val: Int;
}

struct ChainLevel2 {
    nest: ChainLevel3;
}

struct ChainLevel1 {
    nest: ChainLevel2;
}

contract DeepChainStruct {
    obj: ChainLevel1;

    init() {
        self.obj = ChainLevel1{
            nest: ChainLevel2{
                nest: ChainLevel3{
                    val: 77,
                },
            },
        };
    }
}