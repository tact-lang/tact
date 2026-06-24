struct NestedInner {
    foo: Int;
    bar: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    val: Int;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{foo: 1, bar: true},
            val: 2
        };
    }
}