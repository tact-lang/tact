struct Foo {
    x: Int;
}

contract OptionalStructField {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}