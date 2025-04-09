struct Inner {
    s: String;
}

struct Outer {
    innerOpt: Inner?;
}

contract OptionalNestedTest {
    outer: Outer;
    init() {
        self.outer = Outer{ innerOpt: null };
    }
}