struct OptDefaults {
    o1: Int? = null;
    o2: String? = null;
    o3: Address? = null;
}

contract DefaultsOptFields {
    d: OptDefaults;

    init() {
        self.d = OptDefaults{};
    }
}
