struct NestedInner {
    x: Int;
    y: String;
}

struct NestedOuter {
    inner: NestedInner;
    z: Bool;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                x: 42,
                y: "hello",
            },
            z: true,
        };
    }
}