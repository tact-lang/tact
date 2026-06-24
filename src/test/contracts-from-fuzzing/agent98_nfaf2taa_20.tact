struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = false;
    c: String? = "hello";
}

contract OptDefaultsContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}