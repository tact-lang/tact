struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptDefaultsTest {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }

    receive() {
        let _=self.data;
    }
}