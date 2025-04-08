struct SWithDefaults {
    a: Int = 42;
    b: String = "test";
    c: Bool = true;
}

contract C {
    s: SWithDefaults;

    init() {
        self.s = SWithDefaults{};
    }
}