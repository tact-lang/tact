struct OptionalWithDefaults {
    x: Int? = null;
    y: String? = null;
    z: Bool? = null;
}

contract DefaultOptionTest {
    data: OptionalWithDefaults;
    init() {
        self.data = OptionalWithDefaults{};
    }
}