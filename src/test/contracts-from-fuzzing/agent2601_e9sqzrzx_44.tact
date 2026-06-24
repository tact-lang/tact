struct WrapOuter {
    num: Int?;
}

struct Mid {
    w: WrapOuter?;
}

contract OptionalChain {
    mid: Mid?;
    init() {
        self.mid = null;
    }
}