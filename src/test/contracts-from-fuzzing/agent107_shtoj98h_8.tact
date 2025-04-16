struct Inner {
    a: Int;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    field1: Outer;
    field2: Outer;

    init() {
        self.field1 = Outer{ inner: Inner{ a: 1 } };
        self.field2 = Outer{ inner: Inner{ a: 2 } };
    }
}
