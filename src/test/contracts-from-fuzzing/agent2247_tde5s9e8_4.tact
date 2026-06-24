struct NestedOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool?;
}

contract Example {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{
            inner: InnerOpt{
                x: 5,
                y: null
            }
        };
    }
}
