contract BadInitParamSyntax {
    foo: Int;

    init(foo: Int,) {
        self.foo = foo;
    }
}