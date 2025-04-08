struct InnerOpt {
    s: String;
}

contract OptionalTop {
    foo: Int?;
    bar: String?;
    baz: Address?;
    nested: InnerOpt?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.nested = null;
    }

    receive() {}
}
