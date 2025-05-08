struct NestedInner {
    xi: Int;
    yi: Int;
}

struct NestedOuter {
    inner: NestedInner;
}

contract NestedStructContract {
    field: NestedOuter;

    init() {
        self.field = NestedOuter{
            inner: NestedInner{ xi: 1, yi: 2 }
        };
    }
}