struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract TestContract {
    stuff: WithDefaults;

    init() {
        self.stuff = WithDefaults{};
    }
}