struct HasDefaults {
    a: Int = 3;
    b: Bool = true;
    c: String = "default";
}

contract TestContract {
    stored: HasDefaults;

    init() {
        self.stored = HasDefaults{};
    }
}