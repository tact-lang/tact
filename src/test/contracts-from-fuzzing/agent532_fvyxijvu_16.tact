struct InnerMost {
    value: Int;
}

struct Middle {
    inner: InnerMost?;
}

contract VeryNestedOption {
    foo: Middle?;

    init() {
        self.foo = Middle{ inner: null };
    }
}