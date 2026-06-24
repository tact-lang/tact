struct NestedInner {
    c: Int;
    d: Bool?;
}

struct NestedOuter {
    a: Int;
    b: NestedInner;
    e: String?;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            a: 1,
            b: NestedInner{ c: 2, d: true },
            e: "test"
        };
    }
}