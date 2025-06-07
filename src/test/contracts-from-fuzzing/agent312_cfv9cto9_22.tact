struct OptDefaults {
    x: Int? = null;
    y: Bool? = null;
    s: String? = null;
}

contract TestContract {
    data: OptDefaults;
    init() {
        self.data = OptDefaults{};
    }
}