contract TrailingCommaInit {
    foo: Int;
    bar: Bool;
    baz: String;

    init(
        foo: Int,
        bar: Bool,
        baz: String,
    ) {
        self.foo = foo;
        self.bar = bar;
        self.baz = baz;
    }

    receive() {}
}