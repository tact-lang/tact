struct Foo {
    x: Int;
    y: Int?;
}

contract TestContract {
    foo: Foo?;

    init() {
        self.foo = null;
    }
}