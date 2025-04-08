struct WithDefaults {
    a: Int = 11;
    b: Bool = true;
    c: String = "hi";
}

contract StoreWithDefaults {
    stuff: WithDefaults;

    init() {
        self.stuff = WithDefaults{};
    }
}