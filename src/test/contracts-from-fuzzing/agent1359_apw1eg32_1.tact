struct NestedTest {
    innermost: Int;
}

struct MiddleTest {
    optionalInner: NestedTest?;
}

contract DeepOptionalTest {
    field: MiddleTest?;

    init() {
        self.field = null;
    }
}