struct WithDefaults {
    a: Int = 3;
    b: String = "hi";
    c: Bool = true;
}

contract TestContract {
    def: WithDefaults;

    init() {
        self.def = WithDefaults{};
    }
}