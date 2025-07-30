struct Inner {
    foo: Int = 10;
    bar: Int?;
    baz: String = "abc";
}

struct Outer {
    nested: Inner;
    q: Int = 42;
}

contract OmitDefaults {
    store: Outer;
    init() {
        self.store = Outer{ nested: Inner{ }, q: 50 };
    }
}