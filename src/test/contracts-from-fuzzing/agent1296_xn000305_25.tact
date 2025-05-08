struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
}

contract TestContract {
    data: OptDefaults;
    init() {
        self.data = OptDefaults{};
    }
}