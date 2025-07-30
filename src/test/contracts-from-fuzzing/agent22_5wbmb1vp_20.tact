struct WithOptionalDefaults {
    foo: Int? = null;
    bar: String? = null;
    baz: Bool? = null;
}

contract HasOptionalDefaults {
    opt: WithOptionalDefaults;

    init() {
        self.opt = WithOptionalDefaults{};
    }
}