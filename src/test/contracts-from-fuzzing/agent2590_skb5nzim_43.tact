struct StrangeDefaults {
    a: Int? = null;
    b: Int? = 100;
    c: Bool? = null;
    d: Bool? = true;
}

contract StrangeDefaultsContract {
    foo: StrangeDefaults;
    init() {
        self.foo = StrangeDefaults{};
    }
}