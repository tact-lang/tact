struct OptNestedInner {
    a: Int?;
    b: Bool?;
}

struct OptNestedOuter {
    inner: OptNestedInner?;
    c: Int;
}

contract OptNestedContract {
    data: OptNestedOuter;

    init() {
        self.data = OptNestedOuter{
            inner: null,
            c: 11,
        };
    }
}
