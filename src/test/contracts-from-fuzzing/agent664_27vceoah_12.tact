struct OptionalDefaults {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

contract OptDefaultsTest {
    field: OptionalDefaults;

    init() {
        self.field = OptionalDefaults{};
    }
}
