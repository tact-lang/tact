struct ChainA {
    fieldA: Int;
}

struct ChainB {
    chainA: ChainA;
    text: String?;
}

struct ChainC {
    chainB: ChainB;
    flag: Bool;
}

contract ChainComplexContract {
    root: ChainC;

    init() {
        self.root = ChainC{
            chainB: ChainB{
                chainA: ChainA{
                    fieldA: 123
                },
                text: null
            },
            flag: true
        };
    }
}
