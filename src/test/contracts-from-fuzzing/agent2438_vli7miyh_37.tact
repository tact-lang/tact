struct SInner {
    n: Int as uint128;
}

contract InnerSerialization {
    s: SInner;

    init() {
        self.s = SInner{ n: 1234567890 };
    }
}
