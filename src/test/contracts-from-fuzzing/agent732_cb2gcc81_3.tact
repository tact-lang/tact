struct ChainDepth3 {
    level2: ChainDepth2;
}

struct ChainDepth2 {
    level1: ChainDepth1;
}

struct ChainDepth1 {
    flag: Bool;
    text: String;
}

contract ContractChain {
    value: ChainDepth3;

    init() {
        self.value = ChainDepth3{
            level2: ChainDepth2{
                level1: ChainDepth1{
                    flag: false,
                    text: "hello"
                }
            }
        };
    }
}