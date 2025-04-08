struct OptionalWithDefaults {
    s: String = "default";
    b: Bool?;
    i: Int = 42;
}

contract OptDefaultsTest {
    data: OptionalWithDefaults;
    init() {
        self.data = OptionalWithDefaults{
            b: null
        };
    }
}
