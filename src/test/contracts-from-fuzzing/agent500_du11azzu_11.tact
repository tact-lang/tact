struct OptionalWithDefault {
    o1: Int? = null;
    o2: Bool? = true;
    o3: String? = null;
}

contract OptDefaults {
    data: OptionalWithDefault;
    init() {
        self.data = OptionalWithDefault{};
    }
    receive() {}
}