struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsStruct {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}