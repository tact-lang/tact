struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultsContainer {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}