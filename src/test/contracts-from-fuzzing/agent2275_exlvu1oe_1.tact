struct NestedInner {
    d: Int;
}

struct NestedOuter {
    c: NestedInner;
}

contract DeepNestedTest {
    a: Int = 1;
    b: NestedOuter;

    init() {
        self.b = NestedOuter{ c: NestedInner{ d: 42 } };
    }
}