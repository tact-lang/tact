struct OptionalWithDefault {
    x: Int? = null;
    y: String? = null;
}

contract OptDefaults {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{};
    }
}