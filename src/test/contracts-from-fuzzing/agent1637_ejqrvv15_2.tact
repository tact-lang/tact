struct WithDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
}

contract StructWithDefaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}