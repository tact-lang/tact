struct Foo {
    a: Int?
}

struct Bar {
    foo: Foo?
}

contract DeepNull {
    bar: Bar?;

    init() {
        self.bar = null;
    }
}
