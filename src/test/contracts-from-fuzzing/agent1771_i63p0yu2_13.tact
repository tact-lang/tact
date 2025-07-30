struct Foo {
    bar: Int;
}

contract OptStructInitNonNull {
    s: Foo?;

    init() {
        self.s = Foo{ bar: 123 };
    }
}