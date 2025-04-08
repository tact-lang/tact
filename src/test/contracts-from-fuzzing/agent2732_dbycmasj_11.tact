struct OptionalDeep {
    inner: Inner?;
}

struct Inner {
    foo: Foo?;
}

struct Foo {
    bar: Bar?;
}

struct Bar {
    baz: Int?;
}

contract TestContract {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: null
        };
    }
}