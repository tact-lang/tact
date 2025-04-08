struct Inner {
    a: Int;
}

struct Outer {
    nested: Inner;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{ nested: Inner{ a: 42 } };
    }
}