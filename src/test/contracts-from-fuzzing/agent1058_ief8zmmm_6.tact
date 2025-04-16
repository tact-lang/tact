struct WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Address? = null;
}

contract DefaultsTest {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}