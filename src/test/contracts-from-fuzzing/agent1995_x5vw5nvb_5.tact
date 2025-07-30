struct ChainA {
    next: ChainB?;
    note: String;
}

struct ChainB {
    next: ChainC?;
    num: Int as int64;
}

struct ChainC {
    optVal: Int?;
    flag: Bool;
}

contract OptionalChain {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            note: "start",
            next: ChainB{
                num: 99,
                next: ChainC{ optVal: null, flag: false }
            }
        };
    }
}