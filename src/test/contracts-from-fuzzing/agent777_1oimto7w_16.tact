struct HasDefaults {
    count: Int = 100;
    label: String = "default";
    active: Bool = true;
}

contract TestHasDefaults {
    d: HasDefaults;

    init() {
        self.d = HasDefaults{};
    }
}