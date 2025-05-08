struct Inner {
    x: Int;
}

struct Outer {
    i: Inner;
}

contract Test {
    field: Outer?;

    init() {
        self.field = Outer{ i: Inner{ x: 123 } };
    }
}