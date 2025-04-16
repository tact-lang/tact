struct WithDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: String = "hello";
}

contract TestContract {
    w: WithDefaults;

    init() {
        self.w = WithDefaults{};
    }
}