struct ChainC {
    cval: Int;
}

struct ChainB {
    c: ChainC;
    flag: Bool;
}

struct ChainA {
    b: ChainB;
    sval: String;
}

contract ChainStore {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            b: ChainB{
                c: ChainC{cval: 1},
                flag: true,
            },
            sval: "hello",
        };
    }
}