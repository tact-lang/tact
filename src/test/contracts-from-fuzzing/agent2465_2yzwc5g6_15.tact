struct HasDefaults {
    x: Int = 1;
    y: Int = 42;
    flag: Bool = false;
}

contract TestContract {
    storage: HasDefaults;

    init() {
        self.storage = HasDefaults{};
    }
}