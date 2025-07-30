struct WithDefaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultsInStruct {
    d: WithDefaults;
    init() {
        self.d = WithDefaults{};
    }
}
