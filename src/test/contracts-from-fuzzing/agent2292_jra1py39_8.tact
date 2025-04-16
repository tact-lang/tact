struct DefaultOpt {
    foo: Int? = null;
    bar: Bool = false;
    baz: String = "";
}

contract OptionalDefaults {
    st: DefaultOpt;

    init() {
        self.st = DefaultOpt{};
    }
}