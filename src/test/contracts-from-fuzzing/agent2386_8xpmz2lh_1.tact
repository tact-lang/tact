struct NestedInner {
    f1: Int;
    f2: Bool?;
}

struct NestedOuter {
    a: Int;
    b: NestedInner;
}

contract Test {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            a: 1,
            b: NestedInner{f1: 2, f2: true}
        };
    }
}