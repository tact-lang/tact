struct WithConstDefaults {
    a: Int = ton("1");
    b: Int = pow(2, 3);
}

contract ConstDefaults {
    s: WithConstDefaults;

    init() {
        self.s = WithConstDefaults{};
    }
}