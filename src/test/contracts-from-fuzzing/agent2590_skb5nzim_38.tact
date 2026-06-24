struct StringsDefaultsWithOpt {
    a: String = "one";
    b: String? = null;
    c: String = "two";
    d: String? = null;
}

contract StringsDefaultsOptContract {
    foo: StringsDefaultsWithOpt;
    init() {
        self.foo = StringsDefaultsWithOpt{};
    }
}