struct OptionalDefaults {
    foo: Int? = 1;
    bar: Bool?;
    baz: String? = "hello";
}

contract OptionalDefaultsTest {
    state: OptionalDefaults;

    init() {
        self.state = OptionalDefaults{
            foo: null,
            bar: null,
            baz: null
        };
    }
}