struct HasDefaults {
    x: Int = 5;
    y: Bool = false;
    z: String = "hello";
}

contract DefaultsContract {
    field: HasDefaults;

    init() {
        self.field = HasDefaults{};
    }
}