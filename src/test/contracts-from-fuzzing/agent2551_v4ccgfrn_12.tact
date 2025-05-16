struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "default";
}

contract ContractWithDefaults {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}