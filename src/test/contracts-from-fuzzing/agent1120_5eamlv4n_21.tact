struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
}

contract DefStruct {
    s: WithDefaults;

    init() {
        self.s = WithDefaults{};
    }
}