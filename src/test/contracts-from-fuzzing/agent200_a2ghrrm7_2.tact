struct NestedInner {
    x: Int;
    y: Int?;
}

struct NestedOuter {
    z: Int;
    inner: NestedInner;
}

contract NestedStructStorage {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            z: 1,
            inner: NestedInner{
                x: 2,
                y: 3,
            },
        };
    }
}