struct Inner {
    val: Int;
}

struct Mid {
    innerOpt: Inner?;
}

contract NullChain {
    top: Mid?;

    init() {
        self.top = null;
    }
}
