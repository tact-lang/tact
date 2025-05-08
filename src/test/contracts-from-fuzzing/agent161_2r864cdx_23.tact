struct InnerMost {
    v: Int;
}

struct InnerOpt {
    inner: InnerMost?;
}

struct Mid {
    val: InnerOpt;
}

struct OuterWithOptChain {
    top: Mid;
}

contract OptionalDeepNesting {
    data: OuterWithOptChain;

    init() {
        self.data = OuterWithOptChain{ top: Mid{ val: InnerOpt{ inner: null } } };
    }

    receive() {}
}