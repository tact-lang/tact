struct WithDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "str";
}

contract Defaults {
    w: WithDefaults;

    init() {
        self.w = WithDefaults{}; // use defaults
    }
}