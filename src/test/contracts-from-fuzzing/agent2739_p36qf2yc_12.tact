struct OptWithDefaults {
    i: Int? = null;
    b: Bool? = true;
    s: String? = null;
}

contract TestContract {
    value: OptWithDefaults;
    init() {
        self.value = OptWithDefaults{};
    }
}