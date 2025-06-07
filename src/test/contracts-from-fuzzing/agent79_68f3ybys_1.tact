struct NestedInner {
    value: Int;
}

struct NestedOuter {
    inner: NestedInner;
}

contract TestContract {
    field: NestedOuter;

    init() {
        self.field = NestedOuter{
            inner: NestedInner{value: 5}
        };
    }
}