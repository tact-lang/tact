struct Foo {
    bar: Int?;
    baz: Int;
}

contract OptFirst {
    s: Foo;

    init() {
        self.s = Foo{
            bar: null,
            baz: 5,
        };
    }
}