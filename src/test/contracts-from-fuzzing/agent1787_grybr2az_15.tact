struct OptionalEmptyDefaults {
    a: Int?;      // defaults to null
    b: Bool?;     // defaults to null
    c: String?;   // defaults to null
}

contract OptDefaultsTest {
    field: OptionalEmptyDefaults;

    init() {
        self.field = OptionalEmptyDefaults{};
    }
}