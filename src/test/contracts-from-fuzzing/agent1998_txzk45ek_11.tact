struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{};
    }
}