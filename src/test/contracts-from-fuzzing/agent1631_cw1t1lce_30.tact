struct WithDefaults {
    a: Int = 7;
    b: String = "x";
    c: Bool = true;
}

contract DefaultsPersist {
    x: Int;
    y: WithDefaults;

    init() {
        self.x = 5;
        self.y = WithDefaults{};
    }
}