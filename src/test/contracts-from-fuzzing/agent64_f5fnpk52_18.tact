struct InnerMost {
    foo: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    middle: Middle?;
}

contract RecursiveOptionals {
    field: Outer;

    init() {
        self.field = Outer { middle: null };
    }

    receive() {
        self.field.middle = Middle { inner: null };
    }
}