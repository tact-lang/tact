struct InnerMost {
    str: String?;
    sl: Slice?;
    c: Cell?;
}

struct Middle {
    inner: InnerMost;
    txt: String = "default";
    addr: Address?;
}

contract BigNestedOptional {
    data: Middle;

    init() {
        self.data = Middle{
            inner: InnerMost{
                str: null,
                sl: null,
                c: null
            },
            txt: "override",
            addr: null
        };
    }
}