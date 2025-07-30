struct Foo {
    a: Int;
    b: Bool;
}

contract OptionalStructHolder {
    foo: Foo?;
    init() {
        self.foo = null;
    }
}