struct NestedInner {
    e: Int;
}

struct NestedOuter {
    x: Int;
    y: NestedInner;
    z: Int;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            x: 1,
            y: NestedInner{ e: 2 },
            z: 3,
        };
    }
}