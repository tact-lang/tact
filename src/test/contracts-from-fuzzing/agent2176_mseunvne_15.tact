struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
}

contract DefaultsStruct {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}
