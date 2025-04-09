struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract OptNestedTest {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{ innerOpt: null };
    }
}