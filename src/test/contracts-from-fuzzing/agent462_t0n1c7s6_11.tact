struct ChainA {
    next: ChainB;
    valA: Int;
}

struct ChainB {
    next: ChainC;
    valB: Bool;
}

struct ChainC {
    valC: String;
}

contract ChainStructs {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    valC: "chain end"
                },
                valB: true
            },
            valA: 42
        };
    }
}