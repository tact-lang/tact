struct WithDefaults {
    a: Int = 9;
    b: Bool = false;
    c: String = "abc";
}

contract StructDefaults {
    storage: WithDefaults;

    init() {
        self.storage = WithDefaults{};
    }
}