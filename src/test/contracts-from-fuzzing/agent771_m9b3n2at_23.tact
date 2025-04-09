contract NestedStringDefault {
    s: WithStringDefaults;
    init() {
        self.s = WithStringDefaults{};
    }
}

struct WithStringDefaults {
    a: String = "Hello";
    b: String = "World";
}