struct WithDefaults {
    a: Int = 3;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}