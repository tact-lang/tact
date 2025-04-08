struct NestedInner {
    val: Int;
}

struct NestedOuter {
    inner: NestedInner;
    flag: Bool;
}

contract NestedContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{ val: 42 },
            flag: true
        };
    }
}
