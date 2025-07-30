struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String = "default";
}

contract DefaultsContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}