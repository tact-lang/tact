contract NestedOptionalString {
    foo: Outer;

    init() {
        self.foo = Outer{
            x: 5,
            nested: Inner{
                s: null,
                y: 7
            }
        };
    }
}

struct Outer {
    x: Int;
    nested: Inner;
}

struct Inner {
    s: String?; // default implicitly null
    y: Int;
}
