struct WithDefaults {
    a: Int = 10;
    b: Bool = false;
    c: String = "hello";
    d: Int?;
}

contract DefaultsInStruct {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}