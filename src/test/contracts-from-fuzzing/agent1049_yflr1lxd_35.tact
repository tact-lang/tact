struct ChainOne {
    v: Int;
}

struct ChainTwo {
    nested: ChainOne;
}

struct ChainThree {
    nested: ChainTwo;
}

struct ChainFour {
    nested: ChainThree;
}

struct ChainFive {
    nested: ChainFour;
}

contract OptionalDeepChain {
    opt: ChainFive?;

    init() {
        self.opt = null;
    }
}