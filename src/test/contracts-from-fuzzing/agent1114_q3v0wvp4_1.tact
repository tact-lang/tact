struct NestedInner {
    flag: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    count: Int;
    optInner: NestedInner?;
}

contract DeepNestedTest {
    store: NestedOuter;

    init() {
        self.store = NestedOuter{
            inner: NestedInner{flag: true},
            count: 42,
            optInner: null,
        };
    }
}