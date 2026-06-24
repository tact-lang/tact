struct OptionalWithDefaults {
    a: Int? = 1;
    b: Bool? = true;
    s: String? = "hello";
}

contract OptionalDefaultsContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}