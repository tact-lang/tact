struct Foo {
    x: Int;
    y: Int = 5;
}

contract TestContract {
    foo: Foo;

    init() {
        self.foo = Foo{ x: 10 };
    }
}