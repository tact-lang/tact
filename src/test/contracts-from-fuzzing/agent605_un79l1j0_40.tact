struct Base {
    a: Int?
}

struct Mid {
    base: Base
}

struct Top {
    mid: Mid?
}

contract OptionDeepChain {
    val: Top;

    init() {
        self.val = Top {
            mid: null
        };
    }
}