struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
}

contract StructDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}