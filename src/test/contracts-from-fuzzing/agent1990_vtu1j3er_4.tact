struct WithDefaults {
    a: Int = 10;
    b: Bool?;
    c: String = "abc";
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}
