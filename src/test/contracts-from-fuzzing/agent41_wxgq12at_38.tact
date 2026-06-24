struct Level1Opt {
    a: Int?;
}

struct Level2Opt {
    l1: Level1Opt?;
}

contract OptionalTwoLevel {
    s: Level2Opt;

    init() {
        self.s = Level2Opt{l1: null};
    }
}
