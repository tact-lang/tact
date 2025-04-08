struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract TestDefaults {
    wd: WithDefaults;
    init() {
        self.wd = WithDefaults{};
    }
}