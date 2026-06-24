struct OptOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptionalsTopLevel {
    foo: Int? = null;
    bar: Bool? = null;
    nested: OptOpt? = null;

    init() {
        self.foo = 1;
        self.bar = true;
        self.nested = OptOpt{foo: 2, bar: false};
    }
}