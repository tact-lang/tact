struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
}

contract DefaultsTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{};
    }
}