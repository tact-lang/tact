struct WithDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    e: String = "hi";
    f: String?;
}

contract DefaultsTest {
    item: WithDefaults;

    init() {
        self.item = WithDefaults{};
    }
}
