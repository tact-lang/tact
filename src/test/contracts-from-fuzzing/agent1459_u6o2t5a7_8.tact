struct WithDefaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "default";
    d: Int?; // should default to null implicitly
}

contract DefaultStructValues {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}
