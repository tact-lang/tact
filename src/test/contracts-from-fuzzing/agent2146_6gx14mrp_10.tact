struct OptWithDefaults {
    n: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract OptDefaultsTest {
    data: OptWithDefaults;

    init() {
        self.data = OptWithDefaults{}; // use defaults
    }
}