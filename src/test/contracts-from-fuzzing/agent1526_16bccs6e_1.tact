struct NestedInner {
    val: Int;
    optVal: Bool?;
}

struct NestedOuter {
    inner: NestedInner;
    optOuter: NestedInner?;
}

contract DeepNestedTest {
    n: NestedOuter;

    init() {
        self.n = NestedOuter{
            inner: NestedInner{
                val: 1,
                optVal: true,
            },
            optOuter: null,
        };
    }
}