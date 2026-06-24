struct WithDefaults {
    a: Int = 12;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultVals {
    st: WithDefaults;
    init() {
        self.st = WithDefaults{};
    }
}