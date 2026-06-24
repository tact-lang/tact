struct HasDefaults {
    x: Int = 7;
    y: Bool = false;
    z: String = "default";
}

contract StructWithDefaults {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}