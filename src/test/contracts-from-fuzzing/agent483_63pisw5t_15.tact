struct ChainA {
    next: ChainB?;
    tag: String;
}

struct ChainB {
    next: ChainC?;
    tag: String;
}

struct ChainC {
    val: Int;
    flag: Bool;
}

contract ChainOpt {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: null,
                tag: "mid",
            },
            tag: "start",
        };
    }
}
