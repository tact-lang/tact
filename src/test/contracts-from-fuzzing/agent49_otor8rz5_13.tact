struct OptionalConfig {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract TestContract {
    conf: OptionalConfig;

    init() {
        self.conf = OptionalConfig{};
    }
}
