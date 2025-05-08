struct OuterMost {
    inner: InnerMost;
}

struct InnerMost {
    ii: InnerInner;
}

struct InnerInner {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
}

contract VeryNested {
    data: OuterMost;
    init() {
        self.data = OuterMost{
            inner: InnerMost{
                ii: InnerInner{
                    i: 1,
                    b: true,
                    s: "s",
                    c: emptyCell(),
                    sl: emptyCell().asSlice(),
                    bu: beginCell(),
                    a: myAddress(),
                },
            },
        };
    }
}