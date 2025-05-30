struct Level3 {
    f1: Int;
    f2: Bool;
}

struct Level2 {
    nested: Level3;
    optStr: String?;
}

struct Level1 {
    nested: Level2;
    addr: Address;
}

contract ChainContract {
    chainField: Level1;
    init() {
        self.chainField = Level1 {
            nested: Level2 {
                nested: Level3 {
                    f1: 10,
                    f2: false,
                },
                optStr: null,
            },
            addr: myAddress(),
        };
    }
}