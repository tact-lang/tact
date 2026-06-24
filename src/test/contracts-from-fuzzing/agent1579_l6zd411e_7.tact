struct ChainLevel3 {
    z: Bool;
}

struct ChainLevel2 {
    y: ChainLevel3;
}

struct ChainLevel1 {
    x: ChainLevel2;
}

contract DeepChain {
    chain: ChainLevel1;

    init() {
        self.chain = ChainLevel1{
            x: ChainLevel2{
                y: ChainLevel3{z: true}
            }
        };
    }
    receive() {
        self.chain.x.y.z = false;
    }
}