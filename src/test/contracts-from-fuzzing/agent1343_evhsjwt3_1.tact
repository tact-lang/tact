struct Inner {
    a: Int;
}

struct Outer {
    nested: Inner;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{ nested: Inner{ a: 1 } };
    }
}