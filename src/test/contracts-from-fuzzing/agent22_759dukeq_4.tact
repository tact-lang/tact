struct HasDefaults {
    x: Int = 5;
    y: Bool = true;
    z: String = "hello";
}

contract DefaultValuesTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
