struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner;
}

contract Test {
    field: Outer;

    init() {
        self.field = Outer{ nested: Inner{ value: 1 } };
    }
}
