struct OptOptInner {
    a: Int?;
}

struct OuterWrap {
    inner: OptOptInner?;
}

contract NestedOptOptionEmpty {
    x: OuterWrap;

    init() {
        self.x = OuterWrap{ inner: null };
    }
}