struct Inner {
    a: Int;
}

struct Outer {
    inn: Inner;
}

contract Test {
    nested: Outer;
    init() {
        self.nested = Outer{ inn: Inner{ a: 1 } };
    }
}