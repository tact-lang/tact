struct NestedOptions {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract OptionalNestedTest {
    n: NestedOptions;

    init() {
        self.n = NestedOptions{ nested: null };
    }
}