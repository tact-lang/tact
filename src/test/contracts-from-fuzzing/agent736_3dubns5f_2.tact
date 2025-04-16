struct NestedInner {
    x: Int;
    y: Bool;
    s: String;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract NestedStructVar {
    nested: NestedOuter;

    init() {
        self.nested = NestedOuter{
            inner: NestedInner{ x: 1, y: true, s: "foo" },
            flag: false
        };
    }
}