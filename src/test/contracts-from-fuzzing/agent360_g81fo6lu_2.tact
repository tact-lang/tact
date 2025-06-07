struct Foo {
    x: Int;
    y: String;
}

struct Bar {
    foo: Foo?;
}

contract TestContract {
    bar: Bar;

    init() {
        self.bar = Bar{ foo: null };
    }
}