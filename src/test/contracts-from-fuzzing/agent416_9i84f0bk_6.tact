struct NestedOptional {
    val: Int?;
}

struct Top {
    nested: NestedOptional?;
}

contract OptStructOptField {
    foo: Top;

    init() {
        self.foo = Top{ nested: null };
    }
}