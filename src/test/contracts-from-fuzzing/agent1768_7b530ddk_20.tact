struct OptWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestStorage {
    data: OptWithDefaults;

    init() {
        self.data = OptWithDefaults{};
    }
}