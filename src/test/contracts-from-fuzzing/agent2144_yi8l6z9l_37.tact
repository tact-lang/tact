struct OptionalWithDefault {
    foo: Int? = null;
}

contract FooOptDef {
    s: OptionalWithDefault;
    init() {
        self.s = OptionalWithDefault{};
    }
}
