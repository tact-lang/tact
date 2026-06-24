struct Inner {
    foo: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNestedStructContract {
    outer: Outer;

    init() {
        self.outer = Outer{ middle: Middle{ inner: Inner{ foo: 11 } } };
    }
}