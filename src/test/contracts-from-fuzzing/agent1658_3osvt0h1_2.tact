struct NestedInner {
    y: Int;
}

struct NestedOuter {
    x: Int;
    nested: NestedInner;
}

contract TestNested {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            nested: NestedInner{ y: 2 }
        };
    }
}