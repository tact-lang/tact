struct Foo {
    x: Int;
    y: Bool;
}

contract TestContract {
    f: Foo = Foo{x: 5, y: true};
    g: Foo? = null;

    init() {
        self.g = Foo{x: 10, y: false};
    }
}