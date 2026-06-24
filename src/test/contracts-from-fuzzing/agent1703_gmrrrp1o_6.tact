struct NestedOptionalInner {
    x: Int;
}

struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
}

contract NestedOptionalTest {
    outer: NestedOptionalOuter;

    init() {
        self.outer = NestedOptionalOuter{ inner: null };
    }
}