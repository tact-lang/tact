struct Foo {
    value: Int;
}

contract OptStructNullInit {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}