struct WithDefaults {
    i: Int = 1;
    b: Bool = false;
    s: String = "hello";
    optional: Int?;
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{ };
    }
}