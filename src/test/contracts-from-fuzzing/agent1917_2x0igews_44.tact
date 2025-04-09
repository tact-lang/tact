struct StringDefaultOpt {
    s: String? = null;
}

contract StructOptDef {
    foo: StringDefaultOpt;

    init() {
        self.foo = StringDefaultOpt{};
    }
}
