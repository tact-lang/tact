struct NestedOptionalOuter {
    inner: NestedOptionalInner?;
    val: Int;
}

struct NestedOptionalInner {
    x: Int;
    y: Bool;
}

contract NestedOptionalFieldTest {
    data: NestedOptionalOuter;

    init() {
        self.data = NestedOptionalOuter {
            inner: NestedOptionalInner { x: 5, y: false },
            val: 123
        };
    }
}