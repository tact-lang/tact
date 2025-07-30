struct NestedInner {
    a: Int;
    b: Bool;
    s: String;
}

struct NestedOuter {
    inner: NestedInner;
    x: Int;
    y: Bool;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{
                a: 1,
                b: true,
                s: "hi",
            },
            x: 2,
            y: false,
        };
    }
}
