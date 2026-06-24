struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
}

contract DefaultsStore {
    wd: WithDefaults;
    init() {
        self.wd = WithDefaults{};
    }
}