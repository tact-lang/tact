struct WithDefaults {
    a: Int? = 42;
    b: Bool? = true;
    c: String? = "hi";
}

contract ExplicitDefaults {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};  // omit all
    }
}