struct Foo {
    x: Int;
    y: Bool;
}

contract OptionalStructInField {
    foo: Foo?;
    init() {
        self.foo = null;
    }
}