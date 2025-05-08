struct HasDefaults {
    x: Int = 10;
    y: Bool = false;
    z: String = "default";
}

contract TestDefaults {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
