struct WithDefaults {
    a: Int = 1;
    b: Bool?;
    c: String = "text";
}

contract TestDefaults {
    param: WithDefaults;

    init() {
        self.param = WithDefaults{};
    }
}
