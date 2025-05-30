struct DeepOptDefaults {
    x: Int? = null;
    y: Bool? = true;
}

contract DeepOptDefaultsTest {
    p: DeepOptDefaults;

    init() {
        self.p = DeepOptDefaults{};
    }
}