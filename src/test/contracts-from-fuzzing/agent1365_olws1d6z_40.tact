struct OuterMost {
    middle: Middle?;
}

struct Middle {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalChain {
    chain: OuterMost;

    init() {
        self.chain = OuterMost{ middle: null };
    }
}