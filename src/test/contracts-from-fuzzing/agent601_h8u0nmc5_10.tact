struct ChainLevel3 {
    z: Int;
}

struct ChainLevel2 {
    y: ChainLevel3;
}

struct ChainLevel1 {
    x: ChainLevel2;
}

contract ChainNested {
    data: ChainLevel1;

    init() {
        self.data = ChainLevel1{
            x: ChainLevel2{
                y: ChainLevel3{
                    z: 999
                }
            }
        };
    }
}
