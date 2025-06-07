contract OptSliceString {
    foo: Foo;

    init() {
        self.foo = Foo{
            s: null,
            sl: null,
            i: 17
        };
    }
}

struct Foo {
    s: String?;
    sl: Slice?;
    i: Int;
}
