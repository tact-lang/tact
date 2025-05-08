struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
}

contract AssumedDefaults {
    f: WithDefaults;

    init() {
        self.f = WithDefaults{};
    }
}