struct OptNestedInner {
    value: Int?;
}

struct OptNestedOuter {
    inner: OptNestedInner?;
}

contract OptNestedContract {
    field: OptNestedOuter;

    init() {
        self.field = OptNestedOuter{
            inner: null
        };
    }
}