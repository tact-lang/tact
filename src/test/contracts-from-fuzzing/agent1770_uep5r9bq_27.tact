struct Inner {
    x: Int;
}

struct Outer {
    y: Inner;
}

contract OptionalOuter {
    nested: Outer?;

    init() {
        self.nested = null;
    }
}