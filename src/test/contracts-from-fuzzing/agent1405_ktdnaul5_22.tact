struct OptionalWithDefaults {
    a: Int? = null;
    s: String? = null;
}

contract StructOptDefaults {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}