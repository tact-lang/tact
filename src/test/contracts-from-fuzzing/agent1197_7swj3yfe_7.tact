struct OptDefaults {
    foo: Int? = null;
    bar: Bool? = null;
    baz: String? = null;
}

contract OptDefaultsTest {
    s: OptDefaults;

    init() {
        self.s = OptDefaults{}; // no explicit assignment needed
    }
}
