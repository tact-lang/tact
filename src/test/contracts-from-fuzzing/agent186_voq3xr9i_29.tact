struct Inner {
    foo: Int;
    bar: String?;
}

struct Outer {
    baz: Int?;
    inner: Inner?;
}

contract NestedOptionals {
    data: Outer;

    init() {
        self.data = Outer {
            baz: null,
            inner: null
        };
    }
}