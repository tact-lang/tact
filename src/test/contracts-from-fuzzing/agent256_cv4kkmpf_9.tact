struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "DEF";
}

contract StructDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}