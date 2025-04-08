struct WithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "str";
    d: Int?; // defaults to null
    e: Bool?; // defaults to null
}

contract DefaultsTest {
    field: WithDefaults;

    init() {
        self.field = WithDefaults{};
    }
}
