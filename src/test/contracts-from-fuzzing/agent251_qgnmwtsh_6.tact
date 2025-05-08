struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "";
}

contract DefaultsTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }
}