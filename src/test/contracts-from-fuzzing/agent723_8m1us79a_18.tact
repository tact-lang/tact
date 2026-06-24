struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = "default";
}

contract TestContract {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }

    receive() {}
}