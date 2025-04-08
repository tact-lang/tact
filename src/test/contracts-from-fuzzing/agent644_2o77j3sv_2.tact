struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    z: Int;
}

contract NestedStructs {
    vals: NestedOuter;

    init() {
        self.vals = NestedOuter{
            inner: NestedInner{ a: 1, b: false },
            z: 100
        };
    }
}