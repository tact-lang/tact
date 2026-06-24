struct InnerMost {
    val: Int;
}

struct Middle {
    optInner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract OptionChain {
    storage: Outer;

    init() {
        self.storage = Outer{ middle: null };
    }
}