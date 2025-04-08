struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "default";
}

contract Defaults {
    f: WithDefaults;

    init() {
        self.f = WithDefaults{};
    }
}