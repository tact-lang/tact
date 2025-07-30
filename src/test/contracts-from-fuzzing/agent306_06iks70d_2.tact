struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    message: String;
    counter: Int;
}

contract NestedContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{a: 1, b: true},
            message: "test",
            counter: 42
        };
    }
}
