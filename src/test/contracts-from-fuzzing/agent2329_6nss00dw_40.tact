struct OptNestedInner {
    val: Int?;
}

struct OptNestedOuter {
    inner: OptNestedInner?;
}

contract OuterWithOpt {
    store: OptNestedOuter;

    init() {
        self.store = OptNestedOuter{
            inner: OptNestedInner{ val: null }
        };
    }
}
