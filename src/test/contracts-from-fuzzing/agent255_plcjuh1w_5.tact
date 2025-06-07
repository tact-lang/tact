struct S2 {
    val: Int;
}

struct S1 {
    nested: S2;
}

contract OptionalNestedTest {
    opt_nested: S1?;

    init() {
        self.opt_nested = null;
    }
}