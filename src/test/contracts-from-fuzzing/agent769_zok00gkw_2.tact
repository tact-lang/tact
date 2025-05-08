struct NestedInner {
    x: Int;
    y: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    z: String;
}

contract TestContract {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            inner: NestedInner{
                x: 42,
                y: true,
            },
            z: "nested test",
        };
    }

    receive() {
        let _ = self.nested.inner.x + 1;
    }
}