struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "str";
}

contract DefaultStruct {
    s: WithDefaults;
    init() {
        self.s = WithDefaults{};
    }
}