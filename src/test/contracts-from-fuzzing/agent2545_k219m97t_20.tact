struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultStructFieldTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{};
    }
}
