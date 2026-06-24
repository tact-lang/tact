struct NestedInner {
    x: Int;
    y: Int?;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract TestContract {
    s: NestedOuter;

    init() {
        self.s = NestedOuter{
            inner: NestedInner{
                x: 1,
                y: null,
            },
            flag: true,
        };
    }
}