struct InnerMost {
    foo: Int;
}

struct Inner {
    bar: InnerMost?;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{ bar: InnerMost{ foo: 123 } };
    }
}