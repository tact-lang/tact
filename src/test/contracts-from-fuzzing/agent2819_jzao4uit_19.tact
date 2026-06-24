struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract TestContract {
    f: WithDefaults;

    init() {
        self.f = WithDefaults{};
    }
}