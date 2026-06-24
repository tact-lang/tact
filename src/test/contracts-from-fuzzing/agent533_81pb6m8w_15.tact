struct OptionalAndDefaults {
    x: Int? = null;
    y: Int = 5;
}

contract Test {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{};
    }
}