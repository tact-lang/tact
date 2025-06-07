struct Inner {
    a: Int;
    b: Bool;
    c: Int?;
}

contract DeepNested {
    nested: Inner;

    init() {
        self.nested = Inner{ a: 1, b: true, c: null };
    }
}