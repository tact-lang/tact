struct ChainLevel3 {
    p: String;
}

struct ChainLevel2 {
    y: ChainLevel3;
}

struct ChainLevel1 {
    x: ChainLevel2;
}

contract ChainTest {
    nested: ChainLevel1;

    init() {
        self.nested = ChainLevel1{
            x: ChainLevel2{
                y: ChainLevel3{
                    p: "deep",
                },
            },
        };
    }
}
