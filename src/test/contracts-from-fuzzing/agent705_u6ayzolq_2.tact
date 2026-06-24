struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    c: Bool;
    d: Int;
}

contract UsesNestedStruct {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{a: 1, b: true},
            c: false,
            d: 5,
        };
    }
}
