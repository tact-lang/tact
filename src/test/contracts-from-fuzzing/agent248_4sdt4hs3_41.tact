struct OptWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "s";
}

contract Test {
    data: OptWithDefaults;
    init() {
        self.data = OptWithDefaults{};
    }
}