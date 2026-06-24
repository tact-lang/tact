struct Leaf {
    num: Int;
}

struct MidOpt {
    leaf: Leaf?;
}

struct RootOpt {
    mid: MidOpt?;
}

contract OptionalChain {
    root: RootOpt;

    init() {
        self.root = RootOpt{ mid: null };
    }
}