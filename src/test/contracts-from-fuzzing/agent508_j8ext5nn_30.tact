struct Inner {
    i: Int;
}

struct Outer {
    nested: Inner?;
}

contract OptionalNesting {
    state: Outer;

    init() {
        self.state = Outer{ nested: null };
    }
}