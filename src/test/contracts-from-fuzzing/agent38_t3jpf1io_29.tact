struct MidInner {
    a: Int;
    b: Bool;
}

struct MidOuter {
    inner: MidInner;
    val: Int;
}

struct TopMost {
    nested: MidOuter;
    flag: Bool;
    addr: Address;
}

contract NestedComplex {
    field: TopMost;

    init() {
        self.field = TopMost{
            nested: MidOuter{
                inner: MidInner{
                    a: 1,
                    b: false,
                },
                val: 123,
            },
            flag: true,
            addr: myAddress(),
        };
    }
}