struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    n1: NestedInner;
    n2: NestedInner;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            n1: NestedInner{ a: 1, b: true },
            n2: NestedInner{ a: 2, b: false }
        };
    }
}