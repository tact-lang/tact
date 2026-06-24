struct NestedInner {
    a: Int;
    b: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    s: String;
    n: Int?;
}

contract TestContract {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter {
            inner: NestedInner { a: 1, b: true },
            s: "ok",
            n: null
        };
    }
}