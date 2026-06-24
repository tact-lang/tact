struct OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "hello";
}

contract OptsDefaultsTest {
    foo: OptionalsAndDefaults;

    init() {
        self.foo = OptionalsAndDefaults{
            a: 7,
            b: false,
            c: null
        };
    }
}