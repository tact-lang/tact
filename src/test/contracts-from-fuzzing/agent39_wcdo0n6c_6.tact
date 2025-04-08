struct OptNestedInner {
    m: Int;
    n: Bool;
}

struct OptNestedOuter {
    inner: OptNestedInner?;
    k: Int;
}

contract TestContract {
    f: OptNestedOuter;

    init() {
        self.f = OptNestedOuter{
            inner: null,
            k: 100
        };
    }
}