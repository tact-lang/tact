struct OptAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String = "hello";
    d: Int = 42;
    e: Bool? = true;
}

contract DefaultsOptionalsMix {
    data: OptAndDefaults;

    init() {
        self.data = OptAndDefaults{};  // rely on defaults
    }

    receive() {
        self.data = self.data;
    }
}