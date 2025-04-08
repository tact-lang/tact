struct OptDefaults {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract ImplicitNulls {
    st: OptDefaults;

    init() {
        self.st = OptDefaults { };
    }
}