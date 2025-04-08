struct WithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "def";
    d: Int?;
    e: String?;
}

contract DefaultInitTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{};
    }

    receive() {}
}