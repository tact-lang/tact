struct DoubleNested {
    inner: Int;
    optIn: String?;
}

struct TopWrap {
    x: DoubleNested;
}

contract DoubleNestWrap {
    f: TopWrap;

    init() {
        self.f = TopWrap{ x: DoubleNested{ inner:5, optIn:null } };
    }
}