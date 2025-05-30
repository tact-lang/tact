struct HasDefaults {
    x: Int = 12;
    y: Bool = true;
    z: String = "default";
}

contract DefaultsTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}