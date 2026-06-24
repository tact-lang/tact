struct DeepOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DeepOptDefaultsTest {
    payload: DeepOptDefaults;

    init() {
        self.payload = DeepOptDefaults{};
    }
}