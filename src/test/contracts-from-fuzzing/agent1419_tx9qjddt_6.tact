struct OptionalDefaults {
    foo: Int?;
    bar: String? = "default";
    baz: Bool?;
}

contract OptionalDefaultsTest {
    opt: OptionalDefaults;

    init() {
        self.opt = OptionalDefaults{
            foo: null,
            baz: true
        };
    }
}