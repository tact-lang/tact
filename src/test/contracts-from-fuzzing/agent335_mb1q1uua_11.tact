struct HasDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "default";
}

contract DefaultsStructContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}