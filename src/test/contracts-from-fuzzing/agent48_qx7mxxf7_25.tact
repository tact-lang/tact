struct Wrapped {
    flag: Bool;
}

struct OuterWrap {
    nested: Wrapped;
}

contract ChainWrap {
    inner: OuterWrap;

    init() {
        self.inner = OuterWrap{ nested: Wrapped{ flag:true } };
    }
}
