struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    c: String;
}

contract NestedContract {
    persist: NestedOuter;

    init() {
        self.persist = NestedOuter{
            inner: NestedInner{a: 5, b: true},
            c: "hello"
        };
    }
}