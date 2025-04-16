struct NestedOptionalInner {
    x: Int?;
    y: Bool?;
}

struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
    z: Int?;
}

contract TestContract {
    data: NestedOptionalOuter;

    init() {
        self.data = NestedOptionalOuter{
            inner: null,
            z: null
        };
    }
}