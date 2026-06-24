struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: Int? = null;
}

contract DefaultsStructPersist {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}