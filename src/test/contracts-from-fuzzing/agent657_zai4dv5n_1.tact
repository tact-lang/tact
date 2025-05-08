struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    s: String;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{a: 1, b: true},
            s: "hello"
        };
    }
}